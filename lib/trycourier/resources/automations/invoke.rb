# frozen_string_literal: true

module Trycourier
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
        # @param automation [Trycourier::Models::Automations::InvokeInvokeAdHocParams::Automation]
        # @param brand [String, nil]
        # @param data [Hash{Symbol=>Object}, nil]
        # @param profile [Hash{Symbol=>Object}, nil]
        # @param recipient [String, nil]
        # @param template [String, nil]
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::AutomationInvokeResponse]
        #
        # @see Trycourier::Models::Automations::InvokeInvokeAdHocParams
        def invoke_ad_hoc(params)
          parsed, options = Trycourier::Automations::InvokeInvokeAdHocParams.dump_request(params)
          @client.request(
            method: :post,
            path: "automations/invoke",
            body: parsed,
            model: Trycourier::AutomationInvokeResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Trycourier::Models::Automations::InvokeInvokeByTemplateParams} for more
        # details.
        #
        # Invoke an automation run from an automation template.
        #
        # @overload invoke_by_template(template_id, recipient:, brand: nil, data: nil, profile: nil, template: nil, request_options: {})
        #
        # @param template_id [String] A unique identifier representing the automation template to be invoked. This cou
        #
        # @param recipient [String, nil]
        #
        # @param brand [String, nil]
        #
        # @param data [Hash{Symbol=>Object}, nil]
        #
        # @param profile [Hash{Symbol=>Object}, nil]
        #
        # @param template [String, nil]
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::AutomationInvokeResponse]
        #
        # @see Trycourier::Models::Automations::InvokeInvokeByTemplateParams
        def invoke_by_template(template_id, params)
          parsed, options = Trycourier::Automations::InvokeInvokeByTemplateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["automations/%1$s/invoke", template_id],
            body: parsed,
            model: Trycourier::AutomationInvokeResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Trycourier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
