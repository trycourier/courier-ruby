module Courier
  class AuthTokens
    KEY = "/auth"

    def initialize(session)
      @session = session
    end

    def issue_token(scope:, expires_in: nil, data: nil, profile: nil, recipient: nil, template: nil)
      path = "#{KEY}/issue-token"
      payload = {
        "scope": scope
      }

      if expires_in
        payload["expires_in"] = expires_in
      end

      res = @session.send(path, "POST", body: payload, headers: {})
      ErrorHandler.check_err(res)
    end
  end
end
