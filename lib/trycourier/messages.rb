module Courier
  class Messages
    KEY = "/messages"

    def initialize(session)
      @session = session
    end

    def list(cursor: nil, event: nil, list_id: nil, message_id: nil,
      notification: nil, recipient: nil)
      params = {}

      if cursor
        params["cursor"] = cursor
      end
      if event
        params["event"] = event
      end
      if list_id
        params["list"] = list_id
      end
      if message_id
        params["messageId"] = message_id
      end
      if notification
        params["notification"] = notification
      end
      if recipient
        params["recipient"] = recipient
      end
      res = @session.send(KEY, "GET", params: params)
      ErrorHandler.check_err(res)
    end

    def get(message_id:)
      path = "#{KEY}/#{message_id}"
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def get_history(message_id:, type: nil)
      path ="#{KEY}/#{message_id}/history"
      params = {}
      if type
        params["type"] = type
      end
      res = @session.send(path, "GET", params: params)
      ErrorHandler.check_err(res)
    end
  end
end
