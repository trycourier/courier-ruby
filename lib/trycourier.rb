require "trycourier/version"
require "net/http"
require "json"
require "openssl"

module Courier
  class ResponseError < StandardError; end
  class InputError < StandardError; end

  class SendResponse
    attr_reader :code
    attr_reader :message_id

    def initialize(code, message_id)
      @code = code
      @message_id = message_id
    end
  end

  class Client
    def initialize(auth_token = nil)
      @auth_token = auth_token || ENV['COURIER_AUTH_TOKEN']
      @uri = URI.parse('https://api.trycourier.app/send')
      if @auth_token == nil or @auth_token == ""
        raise InputError, "Client requires an auth_token be supplied."
      end
    end

    def send(body)
      if not body.is_a?(Hash)
        raise InputError, "Client#send must be passed a Hash as first argument."
      elsif body["event"] == nil
        raise InputError, "Must specify the 'event' key in Hash supplied to Client#send."
      elsif body["recipient"] == nil
        raise InputError, "Must specify the 'recipient' key in Hash supplied to Client#send."
      elsif body["data"] != nil and not body["data"].is_a?(Hash)
        raise InputError, "The 'data' key in the Hash supplied to Client#send must also be a Hash."
      elsif body["profile"] != nil and not body["profile"].is_a?(Hash)
        raise InputError, "The 'profile' key in the Hash supplied to Client#send must also be a Hash."
      end

      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      req = Net::HTTP::Post.new(@uri)
      req["authorization"] = "Bearer #{@auth_token}"
      req["content-type"] = "application/json"
      req["User-Agent"] = "courier-ruby/#{Courier::VERSION}"
      req.body = body.to_json

      res = http.request(req)
      code = res.code.to_i
      obj = JSON.parse res.read_body

      if code == 200
        message_id = obj["messageId"]
        return SendResponse.new(code, message_id)
      elsif
        message = obj["Message"] == nil ? obj["message"] : obj["Message"]
        err = "#{code}: #{message}"
        raise ResponseError, err
      end
    end
  end
end
