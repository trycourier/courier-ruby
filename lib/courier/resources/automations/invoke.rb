# frozen_string_literal: true

module Courier
  module Resources
    class Automations
      class Invoke
        # Some parameter documentations has been truncated, see
        # {Courier::Models::Automations::InvokeInvokeAdHocParams} for more details.
        #
        # Runs a series of automation steps supplied inline, without a saved template, and
        # returns a runId.
        #
        # @overload invoke_ad_hoc(automation:, brand: nil, data: nil, profile: nil, recipient: nil, template: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
        #
        # @param automation [Courier::Models::Automations::InvokeInvokeAdHocParams::Automation] Body param
        #
        # @param brand [String, nil] Body param
        #
        # @param data [Hash{Symbol=>Object}, nil] Body param
        #
        # @param profile [Hash{Symbol=>Object}, nil] Body param
        #
        # @param recipient [String, nil] Body param
        #
        # @param template [String, nil] Body param
        #
        # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
        #
        # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::AutomationInvokeResponse]
        #
        # @see Courier::Models::Automations::InvokeInvokeAdHocParams
        def invoke_ad_hoc(params)
          parsed, options = Courier::Automations::InvokeInvokeAdHocParams.dump_request(params)
          header_params =
            {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
          @client.request(
            method: :post,
            path: "automations/invoke",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
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
        # @overload invoke_by_template(template_id, recipient:, brand: nil, data: nil, profile: nil, template: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
        #
        # @param template_id [String] Path param: A unique identifier representing the automation template to be invok
        #
        # @param recipient [String, nil] Body param
        #
        # @param brand [String, nil] Body param
        #
        # @param data [Hash{Symbol=>Object}, nil] Body param
        #
        # @param profile [Hash{Symbol=>Object}, nil] Body param
        #
        # @param template [String, nil] Body param
        #
        # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
        #
        # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::AutomationInvokeResponse]
        #
        # @see Courier::Models::Automations::InvokeInvokeByTemplateParams
        def invoke_by_template(template_id, params)
          parsed, options = Courier::Automations::InvokeInvokeByTemplateParams.dump_request(params)
          header_params =
            {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
          @client.request(
            method: :post,
            path: ["automations/%1$s/invoke", template_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
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
