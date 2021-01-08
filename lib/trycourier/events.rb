module Courier
  class Events
    @@key = "/events"

    def initialize(session)
      @session = session
    end

    def list
      res = @session.send(@@key, "GET")
      ErrorHandler.check_err(res)
    end

    def get(event_id)
      path = @@key + "/" + event_id.to_s
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def add(event_id, id, type: "notification")
      replace(event_id, id, type: type)
    end

    def replace(event_id, id, type: "notification")
      path = @@key + "/" + event_id.to_s

      payload = {
        "id" => id,
        "type" => type
      }
      res = @session.send(path, "PUT", body: payload)
      ErrorHandler.check_err_non_json(res)
    end
  end
end
