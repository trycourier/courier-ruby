require "trycourier/version"
require "net/http"
require "json"
require "openssl"

module Courier
  # generic error to catch all exceptions
  class CourierAPIException < StandardError; end

  class Lists
    @@key = "/lists"

    def initialize(base_url, session)
      @url_no_key = base_url
      @base_url = base_url + @@key
      @session = session
    end

    def checkErr(res)
      code = res.code.to_i
      obj = JSON.parse res.read_body

      if code < 400
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

    def send(event, list: nil, pattern: nil, data: {}, brand: nil, override: nil, idempotency_key: nil)
      url = @url_no_key + "/send/list"
      payload = {
        "event": event,
        "data": data
      }
      if list
        payload["list"] = list
      end
      if pattern
        payload["pattern"] = pattern
      end
      if brand
        payload["brand"] = brand
      end
      if override
        payload["override"] = override
      end

      headers = {}
      if idempotency_key
        headers["idempotency_key"] = idempotency_key
      end

      res = @session.send(url, "POST", body: payload, headers: headers)
      checkErr(res)
    end

    def list(cursor: nil, pattern: nil)
      params = {}
      if cursor
        params["cursor"] = cursor
      end
      if pattern
        params["pattern"] = pattern
      end
      res = @session.send(@base_url, "GET", params: params)
      checkErr(res)
    end

    def get(list_id)
      url = @base_url + "/" + list_id.to_s
      res = @session.send(url, "GET")
      checkErr(res)
    end

    def put(list_id, name)
      url = @base_url + "/" + list_id.to_s

      payload = {
        "name": name.to_s
      }

      res = @session.send(url, "PUT", body: payload)
      checkErr2(res)
    end

    def delete(list_id)
      url = @base_url + "/" + list_id.to_s
      res = @session.send(url, "DELETE")
      checkErr2(res)
    end

    def restore(list_id)
      url = @base_url + "/" + list_id.to_s + "/restore"
      res = @session.send(url, "PUT")
      checkErr2(res)
    end

    def get_subscriptions(list_id, cursor: nil)
      url = @base_url + "/" + list_id.to_s + "/subscriptions"
      params = {}
      if cursor
        params["cursor"] = cursor
      end
      res = @session.send(url, "GET", params: params)
      checkErr(res)
    end

    def put_subscriptions(list_id, recipients)
      url = @base_url + "/" + list_id.to_s + "/subscriptions"
      payload = {
        "recipients": recipients
      }
      res = @session.send(url, "PUT", body: payload)
      checkErr2(res)
    end

    def subscribe(list_id, recipient_id)
      url = @base_url + "/" + list_id.to_s + "/subscriptions/" + recipient_id.to_s
      res = @session.send(url, "PUT")
      checkErr2(res)
    end

    def unsubscribe(list_id, recipient_id)
      url = @base_url + "/" + list_id.to_s + "/subscriptions/" + recipient_id.to_s
      res = @session.send(url, "DELETE")
      checkErr2(res)
    end
  end
end
