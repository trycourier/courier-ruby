module Courier
  class Accounts
    KEY = "/accounts"

    def initialize(session)
      @session = session
    end

    def get_account(account_id:)
      path = "#{KEY}/#{account_id}"
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def get_accounts(limit: nil, starting_after: nil)
      params = {}
      if limit
        params["limit"] = limit
      end

      if starting_after
        params["starting_after"] = starting_after
      end

      res = @session.send(KEY, "GET", params: params)
      ErrorHandler.check_err(res)
    end

    def put_account(account_id:, account:)
      path = "#{KEY}/#{account_id}"

      res = @session.send(path, "PUT", body: account, headers: {})
      ErrorHandler.check_err(res)
    end

    def delete_account(account_id:)
      path = "#{KEY}/#{account_id}"
      res = @session.send(path, "DELETE")
      ErrorHandler.check_err_non_json(res)
    end

  end
end
