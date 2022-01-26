module Courier
  class Bulk
    KEY = "/bulk"

    def initialize(session)
      @session = session
    end

    def create_job(message:, idempotency_key: nil, idempotency_expiry: nil)
      path = "#{KEY}"
      payload = {
        "message": message
      }

      headers = {}
      if idempotency_key
        headers["idempotency_key"] = idempotency_key
      end
      if idempotency_expiry
        headers["x-idempotency-expiration"] = idempotency_expiry
      end

      res = @session.send(path, "POST", body: payload, headers: headers)
      ErrorHandler.check_err(res)
    end

    def ingest_job(job_id:, users:, idempotency_key: nil, idempotency_expiry: nil)
      path = "#{KEY}/#{job_id}"
      payload = {
        "users": users
      }

      headers = {}
      if idempotency_key
        headers["idempotency_key"] = idempotency_key
      end
      if idempotency_expiry
        headers["x-idempotency-expiration"] = idempotency_expiry
      end

      res = @session.send(path, "POST", body: payload, headers: headers)
      ErrorHandler.check_err(res)
    end

    def run_job(job_id:, idempotency_key: nil, idempotency_expiry: nil)
      path = "#{KEY}/#{job_id}/run"
      payload = {}

      headers = {}
      if idempotency_key
        headers["idempotency_key"] = idempotency_key
      end
      if idempotency_expiry
        headers["x-idempotency-expiration"] = idempotency_expiry
      end

      res = @session.send(path, "POST", body: payload, headers: headers)
      ErrorHandler.check_err_non_json(res)
    end

    def get_job(job_id:)
      path = "#{KEY}/#{job_id}"
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def get_job_users(job_id:, cursor: nil)
      path = "#{KEY}/#{job_id}/users"

      params = {}
      if cursor
        params["cursor"] = cursor
      end

      res = @session.send(path, "GET", params: params)
      ErrorHandler.check_err(res)
    end
  end
end
