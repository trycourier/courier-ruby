require "trycourier/version"
require "net/http"
require "json"
require "openssl"

module Courier
  # generic error to catch all exceptions
  class CourierAPIException < StandardError; end

  class Messages
    @@key = "/messages"

    def initialize(base_url, session)
      @base_url = base_url + @@key
      @session = session
    end

    def checkErr(res)
      code = res.code.to_i
      obj = JSON.parse res.read_body

      if code == 200
        obj
      elsif (message = obj["Message"].nil? ? obj["message"] : obj["Message"])
        err = "#{code}: #{message}"
        raise CourierAPIException, err
      end
    end

    def list(cursor: nil, event: nil, list_id: nil, message_id: nil,
      notification: nil, recipient: nil)
      params = {}

      if cursor
        params["cursor"] = cursor
      end
      if event
        params["event"] = event
      end
      if list_id
        params["list"] = list_id
      end
      if message_id
        params["messageId"] = message_id
      end
      if notification
        params["notification"] = notification
      end
      if recipient
        params["recipient"] = recipient
      end
      res = @session.send(@base_url, "GET", params: params)
      checkErr(res)
    end

    def get(message_id)
      url = @base_url + "/" + message_id.to_s
      res = @session.send(url, "GET")
      checkErr(res)
    end

    def get_history(message_id, type: nil)
      url = @base_url + "/" + message_id.to_s + "/history"

      params = {}
      if type
        params["type"] = type
      end
      res = @session.send(url, "GET", params: params)

      checkErr(res)
    end
  end
end