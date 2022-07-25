module Courier
  class AuditEvents
    KEY = "/audit-events"

    def initialize(session)
      @session = session
    end

    def get(audit_event_id:)
      path = "#{KEY}/#{audit_event_id}"
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def list(cursor: nil)
      path = "#{KEY}"

      params = {}
      if cursor
        params["cursor"] = cursor
      end

      res = @session.send(path, "GET", params: params)
      ErrorHandler.check_err(res)
    end
  end
end
