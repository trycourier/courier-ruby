# typed: strong

module Courier
  class Client < Courier::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(String) }
    attr_reader :api_key

    # Send a message to one or more recipients — users, lists, audiences, or tenants —
    # across every channel you have configured.
    sig { returns(Courier::Resources::Send) }
    attr_reader :send_

    # Define filter-based groups whose membership Courier recalculates as user
    # profiles change.
    sig { returns(Courier::Resources::Audiences) }
    attr_reader :audiences

    # Configure the channel providers Courier delivers through, and browse the
    # provider types it supports.
    sig { returns(Courier::Resources::Providers) }
    attr_reader :providers

    # Read the audit trail of configuration and access changes in your workspace.
    sig { returns(Courier::Resources::AuditEvents) }
    attr_reader :audit_events

    # Issue scoped, short-lived JWTs so client-side SDKs — Inbox, Preferences, and the
    # embedded designer — can call Courier as a single user. Server-side requests
    # authenticate with your workspace API key instead.
    sig { returns(Courier::Resources::Auth) }
    attr_reader :auth

    # Invoke a stored automation template or an ad hoc automation defined in the
    # request.
    sig { returns(Courier::Resources::Automations) }
    attr_reader :automations

    # Build, version, publish, invoke, and cancel multi-step notification workflows,
    # along with the templates scoped to them.
    sig { returns(Courier::Resources::Journeys) }
    attr_reader :journeys

    # Create a one-off send to a list or audience, author its content, then send it
    # immediately or schedule it for later.
    sig { returns(Courier::Resources::Broadcasts) }
    attr_reader :broadcasts

    # Manage the logos, colors, and layout that give the templates you send a
    # consistent look.
    sig { returns(Courier::Resources::Brands) }
    attr_reader :brands

    sig { returns(Courier::Resources::Digests) }
    attr_reader :digests

    # Record an inbound event that triggers the journeys and automations mapped to it.
    sig { returns(Courier::Resources::Inbound) }
    attr_reader :inbound

    # Manage static groups of users that you subscribe explicitly, and send to them by
    # list id or list pattern.
    sig { returns(Courier::Resources::Lists) }
    attr_reader :lists

    # Look up the messages Courier has accepted, inspect their delivery history and
    # rendered output, and cancel, resend, or archive them.
    sig { returns(Courier::Resources::Messages) }
    attr_reader :messages

    # Look up the messages Courier has accepted, inspect their delivery history and
    # rendered output, and cancel, resend, or archive them.
    sig { returns(Courier::Resources::Requests) }
    attr_reader :requests

    # Create, update, version, publish, and localize notification templates and their
    # content.
    sig { returns(Courier::Resources::Notifications) }
    attr_reader :notifications

    # Define reusable channel routing and failover strategies, and see which templates
    # use them.
    sig { returns(Courier::Resources::RoutingStrategies) }
    attr_reader :routing_strategies

    # Manage the workspace catalog of subscription topics, the sections that group
    # them, and publishing the preference page.
    sig { returns(Courier::Resources::WorkspacePreferences) }
    attr_reader :workspace_preferences

    # Store the contact information Courier delivers to for each user — email, phone
    # number, push tokens, and any custom data you send to.
    sig { returns(Courier::Resources::Profiles) }
    attr_reader :profiles

    # Manage tenants — the organizations, teams, or accounts your users belong to —
    # along with their users and default preferences.
    sig { returns(Courier::Resources::Tenants) }
    attr_reader :tenants

    # Store and retrieve the translation strings Courier uses to render localized
    # template content.
    sig { returns(Courier::Resources::Translations) }
    attr_reader :translations

    sig { returns(Courier::Resources::Users) }
    attr_reader :users

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
