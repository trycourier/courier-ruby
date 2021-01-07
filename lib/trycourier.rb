require "trycourier/events"
require "trycourier/brands"
require "trycourier/lists"
require "trycourier/profiles"
require "trycourier/session"
require "trycourier/messages"
require "trycourier/version"
require "net/http"
require "json"
require "openssl"

module Courier
  # only exception for all other errors
  class CourierAPIException < StandardError; end

  # previous exceptions for send() (so it doesn't break)
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
    def initialize(auth_token: nil, base_url: nil, username: nil, password: nil)
      @base_url = if base_url
        base_url
      elsif ENV["COURIER_BASE_URL"]
        ENV["COURIER_BASE_URL"]
      else
        "https://api.courier.com"
      end

      @session = Courier::CourierAPISession.new

      if auth_token
        @session.init_token_auth(auth_token)
      elsif ENV["COURIER_AUTH_TOKEN"]
        @session.init_token_auth(ENV["COURIER_AUTH_TOKEN"])
      elsif username && password
        @session.init_basic_auth(username, password)
      elsif ENV["COURIER_AUTH_USERNAME"] && ENV["COURIER_AUTH_PASSWORD"]
        @session.init_basic_auth(ENV["COURIER_AUTH_USERNAME"], ENV["COURIER_AUTH_PASSWORD"])
      end

      @messages = Courier::Messages.new(@base_url, @session)
      @profiles = Courier::Profiles.new(@base_url, @session)
      @lists = Courier::Lists.new(@base_url, @session)
      @events = Courier::Events.new(@base_url, @session)
      @brands = Courier::Brands.new(@base_url, @session)
    end

    def send(body)
      if !body.is_a?(Hash)
        raise InputError, "Client#send must be passed a Hash as first argument."
      elsif body["event"].nil?
        raise InputError, "Must specify the 'event' key in Hash supplied to Client#send."
      elsif body["recipient"].nil?
        raise InputError, "Must specify the 'recipient' key in Hash supplied to Client#send."
      elsif !body["data"].nil? && !body["data"].is_a?(Hash)
        raise InputError, "The 'data' key in the Hash supplied to Client#send must also be a Hash."
      elsif !body["profile"].nil? && !body["profile"].is_a?(Hash)
        raise InputError, "The 'profile' key in the Hash supplied to Client#send must also be a Hash."
      end

      url = @base_url + "/send"
      res = @session.send(url, "POST", body: body)

      code = res.code.to_i
      obj = JSON.parse res.read_body

      if code == 200
        message_id = obj["messageId"]
        SendResponse.new(code, message_id)
      elsif (message = obj["Message"].nil? ? obj["message"] : obj["Message"])
        err = "#{code}: #{message}"
        raise ResponseError, err
      end
    end

    # getters for all class variables
    attr_reader :base_url

    attr_reader :session

    attr_reader :messages

    attr_reader :profiles

    attr_reader :events

    attr_reader :lists

    attr_reader :brands
  end
end
