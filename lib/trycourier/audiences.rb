module Courier
  class Audiences
    KEY = "/audiences"

    def initialize(session)
      @session = session
    end

    def get_audience(audience_id:)
      path = "#{KEY}/#{audience_id}"
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def get_audiences(cursor: nil)
      params = {}
      if cursor
        params["cursor"] = cursor
      end

      res = @session.send(KEY, "GET", params: params)
      ErrorHandler.check_err(res)
    end

    def get_audience_members(audience_id:, cursor: nil)
      path = "#{KEY}/#{audience_id}/members"

      params = {}
      if cursor
        params["cursor"] = cursor
      end

      res = @session.send(path, "GET", params: params)
      ErrorHandler.check_err(res)
    end

    def put(audience_id:, payload:)
      path = "#{KEY}/#{audience_id}"

      res = @session.send(path, "PUT", body: payload)
      ErrorHandler.check_err(res)
    end
  end
end
