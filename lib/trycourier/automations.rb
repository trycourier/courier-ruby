module Courier
  class Automations
    KEY = "/automations"

    def initialize(session)
      @session = session
    end

    def invoke(automation:, brand: nil, data: nil, profile: nil, recipient: nil, template: nil)
      path = "#{KEY}/invoke"
      payload = {
        "automation": automation
      }

      if brand
        payload["brand"] = brand
      end

      if data
        payload["data"] = data
      end

      if profile
        payload["profile"] = profile
      end

      if recipient
        payload["recipient"] = recipient
      end

      if template
        payload["template"] = template
      end

      res = @session.send(path, "POST", body: payload, headers: {})
      ErrorHandler.check_err(res)
    end

    def invoke_template(template_id:, brand: nil, data: nil, profile: nil, recipient: nil, template: nil)
      path = "#{KEY}/#{template_id}/invoke"
      payload = {}

      if brand
        payload["brand"] = brand
      end

      if data
        payload["data"] = data
      end

      if profile
        payload["profile"] = profile
      end

      if recipient
        payload["recipient"] = recipient
      end

      if template
        payload["template"] = template
      end

      res = @session.send(path, "POST", body: payload, headers: {})
      ErrorHandler.check_err(res)
    end
  end
end
