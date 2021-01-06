require "trycourier/version"
require "net/http"
require "json"
require "openssl"

module Courier
  # generic error to catch all exceptions
  class CourierAPIException < StandardError; end

  class Profiles
    @@key = "/profiles"

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

    def checkErr2(res)
      code = res.code.to_i
      if code >= 400
        obj = JSON.parse res.read_body
        if (message = obj["Message"].nil? ? obj["message"] : obj["Message"])
          err = "#{code}: #{message}"
          raise CourierAPIException, err
        end
      end
      res
    end

    def get(recipient_id)
      url = @base_url + "/" + recipient_id.to_s
      res = @session.send(url, "GET")
      checkErr(res)
    end

    def get_subscriptions(recipient_id, cursor: nil)
      url = @base_url + "/" + recipient_id.to_s + "/subscriptions"

      params = {}
      if cursor
        params["cursor"] = cursor
      end

      res = @session.send(url, "GET", params: params)
      checkErr(res)
    end

    def add(recipient_id, profile)
      replace(recipient_id, profile)
    end

    def replace(recipient_id, profile)
      url = @base_url + "/" + recipient_id.to_s

      payload = {
        'profile': profile
      }

      res = @session.send(url, "PUT", body: payload)
      checkErr2(res)
    end

    def merge(recipient_id, profile, idempotency_key: nil)
      url = @base_url + "/" + recipient_id.to_s
      payload = {
        'profile': profile
      }
      headers = {}
      if idempotency_key
        headers["Idempotency-Key"] = idempotency_key
      end
      res = @session.send(url, "POST", body: payload, headers: headers)
      checkErr(res)
    end

    def patch(recipient_id, operations)
      url = @base_url + "/" + recipient_id.to_s
      payload = {
        'patch': operations
      }
      res = @session.send(url, "PATCH", body: payload)
      checkErr(res)
    end
  end
end
