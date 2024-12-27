# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "courier/audiences/client"
require_relative "courier/audit_events/client"
require_relative "courier/auth_tokens/client"
require_relative "courier/automations/client"
require_relative "courier/brands/client"
require_relative "courier/bulk/client"
require_relative "courier/inbound/client"
require_relative "courier/lists/client"
require_relative "courier/messages/client"
require_relative "courier/notifications/client"
require_relative "courier/profiles/client"
require_relative "courier/templates/client"
require_relative "courier/tenants/client"
require_relative "courier/translations/client"
require_relative "courier/users/client"
require_relative "courier/send/types/message"
require_relative "courier/types/send_message_response"

module Courier
  class Client
    attr_reader :audiences, :audit_events, :auth_tokens, :automations, :brands, :bulk, :inbound, :lists, :messages,
                :notifications, :profiles, :templates, :tenants, :translations, :users

    # @param environment [Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param authorization_token [String]
    # @return [Client]
    def initialize(authorization_token:, environment: Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = RequestClient.new(environment: environment, max_retries: max_retries,
                                          timeout_in_seconds: timeout_in_seconds, authorization_token: authorization_token)
      @audiences = AudiencesClient.new(request_client: @request_client)
      @audit_events = AuditEventsClient.new(request_client: @request_client)
      @auth_tokens = AuthTokensClient.new(request_client: @request_client)
      @automations = AutomationsClient.new(request_client: @request_client)
      @brands = BrandsClient.new(request_client: @request_client)
      @bulk = BulkClient.new(request_client: @request_client)
      @inbound = InboundClient.new(request_client: @request_client)
      @lists = ListsClient.new(request_client: @request_client)
      @messages = MessagesClient.new(request_client: @request_client)
      @notifications = NotificationsClient.new(request_client: @request_client)
      @profiles = ProfilesClient.new(request_client: @request_client)
      @templates = TemplatesClient.new(request_client: @request_client)
      @tenants = TenantsClient.new(request_client: @request_client)
      @translations = TranslationsClient.new(request_client: @request_client)
      @users = Users::Client.new(request_client: @request_client)
    end

    # Use the send API to send a message to one or more recipients.
    #
    # @param message [Send::ContentMessage, Send::TemplateMessage] Defines the message to be delivered
    # @param request_options [IdempotencyRequestOptions]
    # @return [SendMessageResponse]
    def send(message:, request_options: nil)
      response = @request_client.conn.post("/send") do |req|
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
        req.body = { **(request_options&.additional_body_parameters || {}), message: message }.compact
      end
      SendMessageResponse.from_json(json_object: response.body)
    end
  end

  class AsyncClient
    attr_reader :audiences, :audit_events, :auth_tokens, :automations, :brands, :bulk, :inbound, :lists, :messages,
                :notifications, :profiles, :templates, :tenants, :translations, :users

    # @param environment [Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param authorization_token [String]
    # @return [AsyncClient]
    def initialize(authorization_token:, environment: Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = AsyncRequestClient.new(environment: environment, max_retries: max_retries,
                                                     timeout_in_seconds: timeout_in_seconds, authorization_token: authorization_token)
      @audiences = AsyncAudiencesClient.new(request_client: @async_request_client)
      @audit_events = AsyncAuditEventsClient.new(request_client: @async_request_client)
      @auth_tokens = AsyncAuthTokensClient.new(request_client: @async_request_client)
      @automations = AsyncAutomationsClient.new(request_client: @async_request_client)
      @brands = AsyncBrandsClient.new(request_client: @async_request_client)
      @bulk = AsyncBulkClient.new(request_client: @async_request_client)
      @inbound = AsyncInboundClient.new(request_client: @async_request_client)
      @lists = AsyncListsClient.new(request_client: @async_request_client)
      @messages = AsyncMessagesClient.new(request_client: @async_request_client)
      @notifications = AsyncNotificationsClient.new(request_client: @async_request_client)
      @profiles = AsyncProfilesClient.new(request_client: @async_request_client)
      @templates = AsyncTemplatesClient.new(request_client: @async_request_client)
      @tenants = AsyncTenantsClient.new(request_client: @async_request_client)
      @translations = AsyncTranslationsClient.new(request_client: @async_request_client)
      @users = Users::AsyncClient.new(request_client: @async_request_client)
    end

    # Use the send API to send a message to one or more recipients.
    #
    # @param message [Send::ContentMessage, Send::TemplateMessage] Defines the message to be delivered
    # @param request_options [IdempotencyRequestOptions]
    # @return [SendMessageResponse]
    def send(message:, request_options: nil)
      response = @async_request_client.conn.post("/send") do |req|
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
        req.body = { **(request_options&.additional_body_parameters || {}), message: message }.compact
      end
      SendMessageResponse.from_json(json_object: response.body)
    end
  end
end
