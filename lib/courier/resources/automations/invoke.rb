# frozen_string_literal: true

module Courier
  module Resources
    class Automations
      class Invoke
        # Invoke an ad hoc automation run. This endpoint accepts a JSON payload with a
        # series of automation steps. For information about what steps are available,
        # checkout the ad hoc automation guide
        # [here](https://www.courier.com/docs/automations/steps/).
        #
        # @overload invoke_ad_hoc(automation:, brand: nil, data: nil, profile: nil, recipient: nil, template: nil, request_options: {})
        #
        # @param automation [Courier::Models::Automations::InvokeInvokeAdHocParams::Automation]
        # @param brand [String, nil]
        # @param data [Hash{Symbol=>Object}, nil]
        # @param profile [Object]
        # @param recipient [String, nil]
        # @param template [String, nil]
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Automations::AutomationInvokeResponse]
        #
        # @see Courier::Models::Automations::InvokeInvokeAdHocParams
        def invoke_ad_hoc(params)
          parsed, options = Courier::Automations::InvokeInvokeAdHocParams.dump_request(params)
          @client.request(
            method: :post,
            path: "automations/invoke",
            body: parsed,
            model: Courier::Automations::AutomationInvokeResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Automations::InvokeInvokeByTemplateParams} for more details.
        #
        # Invoke an automation run from an automation template.
        #
        # @overload invoke_by_template(template_id, brand: nil, data: nil, profile: nil, recipient: nil, template: nil, request_options: {})
        #
        # @param template_id [String] A unique identifier representing the automation template to be invoked. This cou
        #
        # @param brand [String, nil]
        #
        # @param data [Hash{Symbol=>Object}, nil]
        #
        # @param profile [Object]
        #
        # @param recipient [String, nil]
        #
        # @param template [String, nil]
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Automations::AutomationInvokeResponse]
        #
        # @see Courier::Models::Automations::InvokeInvokeByTemplateParams
        def invoke_by_template(template_id, params = {})
          parsed, options = Courier::Automations::InvokeInvokeByTemplateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["automations/%1$s/invoke", template_id],
            body: parsed,
            model: Courier::Automations::AutomationInvokeResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
