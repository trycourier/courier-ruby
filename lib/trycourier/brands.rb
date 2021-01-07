require "trycourier/version"
require "net/http"
require "json"
require "openssl"

module Courier
  # generic error to catch all exceptions
  class CourierAPIException < StandardError; end

  class Brands
    @@key = "/brands"

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

    def list(cursor: nil)
      params = {}
      if cursor
        params["cursor"] = cursor
      end
      res = @session.send(@base_url, "GET", params: params)
      checkErr(res)
    end

    def get(brand_id)
      url = @base_url + "/" + brand_id.to_s
      res = @session.send(url, "GET")
      checkErr(res)
    end

    def add(name, settings, id: nil, snippets: nil, idempotency_key: nil)
      replace(name, settings, id: id, snippets: snippets, idempotency_key: idempotency_key)
    end

    def create(name, settings, id: nil, snippets: nil, idempotency_key: nil)
      url = @base_url

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

      res = @session.send(url, "POST", body: payload, headers: headers)
      checkErr(res)
    end

    def replace(brand_id, name, settings, snippets: nil)
      url = @base_url + "/" + brand_id

      payload = {
        "name" => name,
        "settings" => settings
      }
      if snippets
        payload["snippets"] = snippets
      end

      res = @session.send(url, "PUT", body: payload)
      checkErr2(res)
    end

    def delete(brand_id)
      url = @base_url + "/" + brand_id
      res = @session.send(url, "DELETE")
      checkErr2(res)
    end
  end
end
