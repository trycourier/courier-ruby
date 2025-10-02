# frozen_string_literal: true

module Courier
  module Automations
    class Client
      # @return [Courier::Automations::Client]
      def initialize(client:)
        @client = client
      end

      # Invoke an automation run from an automation template.
      #
      # @return [Courier::Automations::Types::AutomationInvokeResponse]
      def invoke_automation_template(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "POST",
          path: "/automations/#{params[:templateId]}/invoke",
          body: Courier::Automations::Types::AutomationInvokeParams.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Automations::Types::AutomationInvokeResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Invoke an ad hoc automation run. This endpoint accepts a JSON payload with a series of automation steps. For information about what steps are available, checkout the ad hoc automation guide [here](https://www.courier.com/docs/automations/steps/).
      #
      # @return [Courier::Automations::Types::AutomationInvokeResponse]
      def invoke_ad_hoc_automation(request_options: {}, **params)
        _request = Courier::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Courier::Environment::PRODUCTION,
          method: "POST",
          path: "/automations/invoke",
          body: Courier::Automations::Types::AutomationAdHocInvokeParams.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Courier::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Courier::Automations::Types::AutomationInvokeResponse.load(_response.body)
        else
          error_class = Courier::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
