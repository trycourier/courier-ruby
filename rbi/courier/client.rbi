# typed: strong

module Courier
  class Client < Courier::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(String) }
    attr_reader :api_key

    sig { returns(Courier::Resources::Send) }
    attr_reader :send_

    sig { returns(Courier::Resources::Tenants) }
    attr_reader :tenants

    sig { returns(Courier::Resources::Audiences) }
    attr_reader :audiences

    sig { returns(Courier::Resources::Bulk) }
    attr_reader :bulk

    sig { returns(Courier::Resources::Users) }
    attr_reader :users

    sig { returns(Courier::Resources::AuditEvents) }
    attr_reader :audit_events

    sig { returns(Courier::Resources::Automations) }
    attr_reader :automations

    sig { returns(Courier::Resources::Brands) }
    attr_reader :brands

    sig { returns(Courier::Resources::Lists) }
    attr_reader :lists

    sig { returns(Courier::Resources::Messages) }
    attr_reader :messages

    sig { returns(Courier::Resources::Notifications) }
    attr_reader :notifications

    sig { returns(Courier::Resources::Auth) }
    attr_reader :auth

    sig { returns(Courier::Resources::Inbound) }
    attr_reader :inbound

    sig { returns(Courier::Resources::Requests) }
    attr_reader :requests

    sig { returns(Courier::Resources::Profiles) }
    attr_reader :profiles

    sig { returns(Courier::Resources::Translations) }
    attr_reader :translations

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["COURIER_API_KEY"]`
      api_key: ENV["COURIER_API_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["COURIER_BASE_URL"]`
      base_url: ENV["COURIER_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Courier::Client::DEFAULT_MAX_RETRIES,
      timeout: Courier::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Courier::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Courier::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
