# frozen_string_literal: true

module Courier
  class Client < Courier::Internal::Transport::BaseClient
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

    # @return [Courier::Resources::Send]
    attr_reader :send_

    # @return [Courier::Resources::Audiences]
    attr_reader :audiences

    # @return [Courier::Resources::AuditEvents]
    attr_reader :audit_events

    # @return [Courier::Resources::Auth]
    attr_reader :auth

    # @return [Courier::Resources::Automations]
    attr_reader :automations

    # @return [Courier::Resources::Brands]
    attr_reader :brands

    # @return [Courier::Resources::Bulk]
    attr_reader :bulk

    # @return [Courier::Resources::Inbound]
    attr_reader :inbound

    # @return [Courier::Resources::Lists]
    attr_reader :lists

    # @return [Courier::Resources::Messages]
    attr_reader :messages

    # @return [Courier::Resources::Requests]
    attr_reader :requests

    # @return [Courier::Resources::Notifications]
    attr_reader :notifications

    # @return [Courier::Resources::Profiles]
    attr_reader :profiles

    # @return [Courier::Resources::Tenants]
    attr_reader :tenants

    # @return [Courier::Resources::Translations]
    attr_reader :translations

    # @return [Courier::Resources::Users]
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

      @send_ = Courier::Resources::Send.new(client: self)
      @audiences = Courier::Resources::Audiences.new(client: self)
      @audit_events = Courier::Resources::AuditEvents.new(client: self)
      @auth = Courier::Resources::Auth.new(client: self)
      @automations = Courier::Resources::Automations.new(client: self)
      @brands = Courier::Resources::Brands.new(client: self)
      @bulk = Courier::Resources::Bulk.new(client: self)
      @inbound = Courier::Resources::Inbound.new(client: self)
      @lists = Courier::Resources::Lists.new(client: self)
      @messages = Courier::Resources::Messages.new(client: self)
      @requests = Courier::Resources::Requests.new(client: self)
      @notifications = Courier::Resources::Notifications.new(client: self)
      @profiles = Courier::Resources::Profiles.new(client: self)
      @tenants = Courier::Resources::Tenants.new(client: self)
      @translations = Courier::Resources::Translations.new(client: self)
      @users = Courier::Resources::Users.new(client: self)
    end
  end
end
