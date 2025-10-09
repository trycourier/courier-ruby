# frozen_string_literal: true

module Trycourier
  class Client < Trycourier::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String]
    attr_reader :api_key

    # @return [Trycourier::Resources::Send]
    attr_reader :send_

    # @return [Trycourier::Resources::Audiences]
    attr_reader :audiences

    # @return [Trycourier::Resources::AuditEvents]
    attr_reader :audit_events

    # @return [Trycourier::Resources::Auth]
    attr_reader :auth

    # @return [Trycourier::Resources::Automations]
    attr_reader :automations

    # @return [Trycourier::Resources::Brands]
    attr_reader :brands

    # @return [Trycourier::Resources::Bulk]
    attr_reader :bulk

    # @return [Trycourier::Resources::Inbound]
    attr_reader :inbound

    # @return [Trycourier::Resources::Lists]
    attr_reader :lists

    # @return [Trycourier::Resources::Messages]
    attr_reader :messages

    # @return [Trycourier::Resources::Requests]
    attr_reader :requests

    # @return [Trycourier::Resources::Notifications]
    attr_reader :notifications

    # @return [Trycourier::Resources::Profiles]
    attr_reader :profiles

    # @return [Trycourier::Resources::Tenants]
    attr_reader :tenants

    # @return [Trycourier::Resources::Translations]
    attr_reader :translations

    # @return [Trycourier::Resources::Users]
    attr_reader :users

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["COURIER_API_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["COURIER_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["COURIER_API_KEY"],
      base_url: ENV["COURIER_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.courier.com"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"COURIER_API_KEY\"")
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @send_ = Trycourier::Resources::Send.new(client: self)
      @audiences = Trycourier::Resources::Audiences.new(client: self)
      @audit_events = Trycourier::Resources::AuditEvents.new(client: self)
      @auth = Trycourier::Resources::Auth.new(client: self)
      @automations = Trycourier::Resources::Automations.new(client: self)
      @brands = Trycourier::Resources::Brands.new(client: self)
      @bulk = Trycourier::Resources::Bulk.new(client: self)
      @inbound = Trycourier::Resources::Inbound.new(client: self)
      @lists = Trycourier::Resources::Lists.new(client: self)
      @messages = Trycourier::Resources::Messages.new(client: self)
      @requests = Trycourier::Resources::Requests.new(client: self)
      @notifications = Trycourier::Resources::Notifications.new(client: self)
      @profiles = Trycourier::Resources::Profiles.new(client: self)
      @tenants = Trycourier::Resources::Tenants.new(client: self)
      @translations = Trycourier::Resources::Translations.new(client: self)
      @users = Trycourier::Resources::Users.new(client: self)
    end
  end
end
