require "trycourier/version"
require "net/http"
require "json"
require "openssl"

module Courier
  # generic error to catch all exceptions
  class CourierAPIException < StandardError; end

  class Brands
    @@key = "/brands"

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

    def list(cursor: nil)
      params = {}
      if cursor
        params["cursor"] = cursor
      end
      res = @session.send(@@key, "GET", params: params)
      checkErr(res)
    end

    def get(brand_id)
      path = @@key + "/" + brand_id.to_s
      res = @session.send(path, "GET")
      checkErr(res)
    end

    def add(name, settings, id: nil, snippets: nil, idempotency_key: nil)
      replace(name, settings, id: id, snippets: snippets, idempotency_key: idempotency_key)
    end

    def create(name, settings, id: nil, snippets: nil, idempotency_key: nil)
      headers = {}
      if idempotency_key
        headers["idempotency_key"] = idempotency_key
      end

      payload = {
        "name" => name,
        "settings" => settings
      }
      if id
        payload["id"] = id
      end
      if snippets
        payload["snippets"] = snippets
      end

      res = @session.send(@@key, "POST", body: payload, headers: headers)
      checkErr(res)
    end

    def replace(brand_id, name, settings, snippets: nil)
      path = @@key + "/" + brand_id

      payload = {
        "name" => name,
        "settings" => settings
      }
      if snippets
        payload["snippets"] = snippets
      end

      res = @session.send(path, "PUT", body: payload)
      checkErr2(res)
    end

    def delete(brand_id)
      path = @@key + "/" + brand_id
      res = @session.send(path, "DELETE")
      checkErr2(res)
    end
  end
end
