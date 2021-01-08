require "trycourier/version"
require "net/http"
require "json"
require "openssl"

module Courier
  # generic error to catch all exceptions
  class CourierAPIException < StandardError; end

  class Events
    @@key = "/events"

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

    def list
      res = @session.send(@@key, "GET")
      checkErr(res)
    end

    def get(event_id)
      path = @@key + "/" + event_id.to_s
      res = @session.send(path, "GET")
      checkErr(res)
    end

    def add(event_id, id, type: "notification")
      replace(event_id, id, type: type)
    end

    def replace(event_id, id, type: "notification")
      path = @@key + "/" + event_id.to_s

      payload = {
        "id" => id,
        "type" => type
      }
      res = @session.send(path, "PUT", body: payload)
      checkErr2(res)
    end
  end
end
