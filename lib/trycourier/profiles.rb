module Courier
  class Profiles
    KEY = "/profiles"

    def initialize(session)
      @session = session
    end

    def get(recipient_id:)
      path = "#{KEY}/#{recipient_id}"
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def get_subscriptions(recipient_id:, cursor: nil)
      path = "#{KEY}/#{recipient_id}/subscriptions"

      params = {}
      if cursor
        params["cursor"] = cursor
      end

      res = @session.send(path, "GET", params: params)
      ErrorHandler.check_err(res)
    end

    def add(recipient_id:, profile:)
      replace(recipient_id: recipient_id, profile: profile)
    end

    def replace(recipient_id:, profile:)
      path = "#{KEY}/#{recipient_id}"

      payload = {
        profile: profile
      }

      res = @session.send(path, "PUT", body: payload)
      ErrorHandler.check_err_non_json(res)
    end

    def merge(recipient_id:, profile:, idempotency_key: nil)
      path = "#{KEY}/#{recipient_id}"
      payload = {
        profile: profile
      }
      headers = {}
      if idempotency_key
        headers["Idempotency-Key"] = idempotency_key
      end
      res = @session.send(path, "POST", body: payload, headers: headers)
      ErrorHandler.check_err(res)
    end

    def patch(recipient_id:, operations:)
      path = "#{KEY}/#{recipient_id}"
      payload = {
        patch: operations
      }
      res = @session.send(path, "PATCH", body: payload)
      ErrorHandler.check_err(res)
    end
  end
end
