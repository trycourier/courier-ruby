# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/automation_invoke_params"
require_relative "types/automation_invoke_response"
require_relative "types/automation_ad_hoc_invoke_params"
require "async"

module Courier
  class AutomationsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [AutomationsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Invoke an automation run from an automation template.
    #
    # @param template_id [String] A unique identifier representing the automation template to be invoked. This could be the Automation Template ID or the Automation Template Alias.
    # @param request [Hash] Request of type Automations::AutomationInvokeParams, as a Hash
    #   * :brand (String)
    #   * :data (Hash{String => String})
    #   * :profile (Automations::PROFILE)
    #   * :recipient (String)
    #   * :template (String)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Automations::AutomationInvokeResponse]
    def invoke_automation_template(template_id:, request:, request_options: nil)
      response = @request_client.conn.post("/automations/#{template_id}/invoke") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
        unless request_options&.idempotency_expiry.nil?
          req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
      end
      Automations::AutomationInvokeResponse.from_json(json_object: response.body)
    end

    # Invoke an ad hoc automation run. This endpoint accepts a JSON payload with a series of automation steps. For information about what steps are available, checkout the ad hoc automation guide [here](https://www.courier.com/docs/automations/steps/).
    #
    # @param request [Hash] Request of type Automations::AutomationAdHocInvokeParams, as a Hash
    #   * :automation (Hash)
    #     * :cancelation_token (String)
    #     * :steps (Array<Automations::AutomationStepOption>)
    #   * :brand (String)
    #   * :data (Hash{String => String})
    #   * :profile (Automations::PROFILE)
    #   * :recipient (String)
    #   * :template (String)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Automations::AutomationInvokeResponse]
    def invoke_ad_hoc_automation(request:, request_options: nil)
      response = @request_client.conn.post("/automations/invoke") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
        unless request_options&.idempotency_expiry.nil?
          req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
      end
      Automations::AutomationInvokeResponse.from_json(json_object: response.body)
    end
  end

  class AsyncAutomationsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncAutomationsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Invoke an automation run from an automation template.
    #
    # @param template_id [String] A unique identifier representing the automation template to be invoked. This could be the Automation Template ID or the Automation Template Alias.
    # @param request [Hash] Request of type Automations::AutomationInvokeParams, as a Hash
    #   * :brand (String)
    #   * :data (Hash{String => String})
    #   * :profile (Automations::PROFILE)
    #   * :recipient (String)
    #   * :template (String)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Automations::AutomationInvokeResponse]
    def invoke_automation_template(template_id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.post("/automations/#{template_id}/invoke") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
          unless request_options&.idempotency_expiry.nil?
            req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
        Automations::AutomationInvokeResponse.from_json(json_object: response.body)
      end
    end

    # Invoke an ad hoc automation run. This endpoint accepts a JSON payload with a series of automation steps. For information about what steps are available, checkout the ad hoc automation guide [here](https://www.courier.com/docs/automations/steps/).
    #
    # @param request [Hash] Request of type Automations::AutomationAdHocInvokeParams, as a Hash
    #   * :automation (Hash)
    #     * :cancelation_token (String)
    #     * :steps (Array<Automations::AutomationStepOption>)
    #   * :brand (String)
    #   * :data (Hash{String => String})
    #   * :profile (Automations::PROFILE)
    #   * :recipient (String)
    #   * :template (String)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Automations::AutomationInvokeResponse]
    def invoke_ad_hoc_automation(request:, request_options: nil)
      Async do
        response = @request_client.conn.post("/automations/invoke") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
          unless request_options&.idempotency_expiry.nil?
            req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
        Automations::AutomationInvokeResponse.from_json(json_object: response.body)
      end
    end
  end
end
