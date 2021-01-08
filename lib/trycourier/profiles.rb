require "net/http"
require "json"
require "openssl"

module Courier
  # generic error to catch all exceptions
  class CourierAPIException < StandardError; end

  class Profiles
    @@key = "/profiles"

    def initialize(session)
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
      path = @@key + "/" + recipient_id.to_s
      res = @session.send(path, "GET")
      checkErr(res)
    end

    def get_subscriptions(recipient_id, cursor: nil)
      path = @@key + "/" + recipient_id.to_s + "/subscriptions"

      params = {}
      if cursor
        params["cursor"] = cursor
      end

      res = @session.send(path, "GET", params: params)
      checkErr(res)
    end

    def add(recipient_id, profile)
      replace(recipient_id, profile)
    end

    def replace(recipient_id, profile)
      path = @@key + "/" + recipient_id.to_s

      payload = {
        'profile': profile
      }

      res = @session.send(path, "PUT", body: payload)
      checkErr2(res)
    end

    def merge(recipient_id, profile, idempotency_key: nil)
      path = @@key + "/" + recipient_id.to_s
      payload = {
        'profile': profile
      }
      headers = {}
      if idempotency_key
        headers["Idempotency-Key"] = idempotency_key
      end
      res = @session.send(path, "POST", body: payload, headers: headers)
      checkErr(res)
    end

    def patch(recipient_id, operations)
      path = @@key + "/" + recipient_id.to_s
      payload = {
        'patch': operations
      }
      res = @session.send(path, "PATCH", body: payload)
      checkErr(res)
    end
  end
end
