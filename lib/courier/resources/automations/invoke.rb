# frozen_string_literal: true

module Courier
  module Resources
    class Automations
      class Invoke
        # Runs a series of automation steps supplied inline, without a saved template, and
        # returns a runId.
        #
        # @overload invoke_ad_hoc(automation:, brand: nil, data: nil, profile: nil, recipient: nil, template: nil, request_options: {})
        #
        # @param automation [Courier::Models::Automations::InvokeInvokeAdHocParams::Automation]
        # @param brand [String, nil]
        # @param data [Hash{Symbol=>Object}, nil]
        # @param profile [Hash{Symbol=>Object}, nil]
        # @param recipient [String, nil]
        # @param template [String, nil]
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::AutomationInvokeResponse]
        #
        # @see Courier::Models::Automations::InvokeInvokeAdHocParams
        def invoke_ad_hoc(params)
          parsed, options = Courier::Automations::InvokeInvokeAdHocParams.dump_request(params)
          @client.request(
            method: :post,
            path: "automations/invoke",
            body: parsed,
            model: Courier::AutomationInvokeResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Automations::InvokeInvokeByTemplateParams} for more details.
        #
        # Starts an automation run from a saved template for one recipient, with optional
        # data and profile, and returns a runId.
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
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::AutomationInvokeResponse]
        #
        # @see Courier::Models::Automations::InvokeInvokeByTemplateParams
        def invoke_by_template(template_id, params)
          parsed, options = Courier::Automations::InvokeInvokeByTemplateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["automations/%1$s/invoke", template_id],
            body: parsed,
            model: Courier::AutomationInvokeResponse,
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
