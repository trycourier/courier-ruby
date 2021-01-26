module Courier
  class Events
    KEY = "/events"

    def initialize(session)
      @session = session
    end

    def list
      res = @session.send(KEY, "GET")
      ErrorHandler.check_err(res)
    end

    def get(event_id:)
      path = "#{KEY}/#{event_id}"
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def add(event_id:, id:, type: "notification")
      replace(event_id: event_id, id: id, type: type)
    end

    def replace(event_id:, id:, type: "notification")
      path = "#{KEY}/#{event_id}"

      payload = {
        "id" => id,
        "type" => type
      }
      res = @session.send(path, "PUT", body: payload)
      ErrorHandler.check_err_non_json(res)
    end
  end
end
