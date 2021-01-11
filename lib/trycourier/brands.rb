module Courier
  class Brands
    @@key = "/brands"

    def initialize(session)
      @session = session
    end

    def list(cursor: nil)
      params = {}
      if cursor
        params["cursor"] = cursor
      end
      res = @session.send(@@key, "GET", params: params)
      ErrorHandler.check_err(res)
    end

    def get(brand_id)
      path = @@key + "/" + brand_id.to_s
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def add(name, settings, id: nil, snippets: nil, idempotency_key: nil)
      create(name, settings, id: id, snippets: snippets, idempotency_key: idempotency_key)
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
      ErrorHandler.check_err(res)
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
      ErrorHandler.check_err_non_json(res)
    end

    def delete(brand_id)
      path = @@key + "/" + brand_id
      res = @session.send(path, "DELETE")
      ErrorHandler.check_err_non_json(res)
    end
  end
end
