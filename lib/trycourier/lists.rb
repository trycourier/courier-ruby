module Courier
  class Lists
    KEY = "/lists"

    def initialize(session)
      @session = session
    end

    def send(event:, list: nil, pattern: nil, data: {}, brand: nil, override: nil, idempotency_key: nil)
      path = "/send/list"
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

      res = @session.send(path, "POST", body: payload, headers: headers)
      ErrorHandler.check_err(res)
    end

    def list(cursor: nil, pattern: nil)
      params = {}
      if cursor
        params["cursor"] = cursor
      end
      if pattern
        params["pattern"] = pattern
      end
      res = @session.send(KEY, "GET", params: params)
      ErrorHandler.check_err(res)
    end

    def get(list_id:)
      path = "#{KEY}/#{list_id}"
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def put(list_id:, name:)
      path = "#{KEY}/#{list_id}"

      payload = {
        "name": name.to_s
      }

      res = @session.send(path, "PUT", body: payload)
      ErrorHandler.check_err_non_json(res)
    end

    def delete(list_id:)
      path = "#{KEY}/#{list_id}"
      res = @session.send(path, "DELETE")
      ErrorHandler.check_err_non_json(res)
    end

    def restore(list_id:)
      path = "#{KEY}/#{list_id}/restore"
      res = @session.send(path, "PUT")
      ErrorHandler.check_err_non_json(res)
    end

    def get_subscriptions(list_id:, cursor: nil)
      path = "#{KEY}/#{list_id}/subscriptions"
      params = {}
      if cursor
        params["cursor"] = cursor
      end
      res = @session.send(path, "GET", params: params)
      ErrorHandler.check_err(res)
    end

    def put_subscriptions(list_id:, recipients:)
      path = "#{KEY}/#{list_id}/subscriptions"
      payload = {
        "recipients": recipients
      }
      res = @session.send(path, "PUT", body: payload)
      ErrorHandler.check_err_non_json(res)
    end

    def subscribe(list_id:, recipient_id:)
      path = "#{KEY}/#{list_id}/subscriptions/#{recipient_id}"
      res = @session.send(path, "PUT")
      ErrorHandler.check_err_non_json(res)
    end

    def unsubscribe(list_id:, recipient_id:)
      path = "#{KEY}/#{list_id}/subscriptions/#{recipient_id}"
      res = @session.send(path, "DELETE")
      ErrorHandler.check_err_non_json(res)
    end
  end
end
