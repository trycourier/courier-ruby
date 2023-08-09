module Courier
  class Tenants
    KEY = "/tenants"

    def initialize(session)
      @session = session
    end

    def get_tenant(tenant_id:)
      path = "#{KEY}/#{tenant_id}"
      res = @session.send(path, "GET")
      ErrorHandler.check_err(res)
    end

    def get_tenants(limit: nil, cursor: nil)
      params = {}
      if limit
        params["limit"] = limit
      end

      if cursor
        params["cursor"] = cursor
      end

      res = @session.send(KEY, "GET", params: params)
      ErrorHandler.check_err(res)
    end

    def put_tenant(tenant_id:, tenant:)
      path = "#{KEY}/#{tenant_id}"

      res = @session.send(path, "PUT", body: tenant, headers: {})
      ErrorHandler.check_err(res)
    end

    def delete_tenant(tenant_id:)
      path = "#{KEY}/#{tenant_id}"
      res = @session.send(path, "DELETE")
      ErrorHandler.check_err_non_json(res)
    end

  end
end
