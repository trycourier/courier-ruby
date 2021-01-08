require "net/http"
require "json"
require "openssl"
require "base64"

module Courier
  # generic error to catch all exceptions
  class CourierAPIException < StandardError; end

  class CourierAPISession

    def initialize(base_url)
      @base_url = base_url
      @auth_token = nil
      @username = nil
      @password = nil
      @auth_method = nil
    end

    def init_token_auth(auth_token)
      @auth_token = "Bearer #{auth_token}"
      @auth_method = "token"
    end

    def init_basic_auth(username, password)
      @username = username
      @password = password
      @auth_method = "basic"
    end

    def send(path, method, params: nil, body: nil, headers: nil)
      uri = URI.parse(@base_url + path.to_s)
      if params
        uri.query = URI.encode_www_form(params)
      end
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      req = case method
      when "GET"
        Net::HTTP::Get.new(uri)
      when "POST"
        Net::HTTP::Post.new(uri)
      when "PUT"
        Net::HTTP::Put.new(uri)
      when "PATCH"
        Net::HTTP::Patch.new(uri)
      when "DELETE"
        Net::HTTP::Delete.new(uri)
      else
        Net::HTTP::Get.new(uri)
      end

      case @auth_method
      when "token"
        req["authorization"] = @auth_token
      when "basic"
        req.basic_auth @username, @password
      end

      req["content-type"] = "application/json"
      req["User-Agent"] = "courier-ruby/#{Courier::VERSION}"

      if body
        req.body = body.to_json
      end

      if headers
        headers.each do |k, v|
          req.add_field(k.to_s, v.to_s)
        end
      end

      http.request(req)
    end

    def isAuthenticated
      if !@auth_method.nil?
        true
      else
        false
      end
    end

    #getter for base url (for testing)
    attr_reader :base_url
  end
end
