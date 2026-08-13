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

    # Send a message to one or more recipients — users, lists, audiences, or tenants —
    # across every channel you have configured.
    # @return [Courier::Resources::Send]
    attr_reader :send_

    # Define filter-based groups whose membership Courier recalculates as user
    # profiles change.
    # @return [Courier::Resources::Audiences]
    attr_reader :audiences

    # Configure the channel providers Courier delivers through, and browse the
    # provider types it supports.
    # @return [Courier::Resources::Providers]
    attr_reader :providers

    # Read the audit trail of configuration and access changes in your workspace.
    # @return [Courier::Resources::AuditEvents]
    attr_reader :audit_events

    # Issue scoped, short-lived JWTs so client-side SDKs — Inbox, Preferences, and the
    # embedded designer — can call Courier as a single user. Server-side requests
    # authenticate with your workspace API key instead.
    # @return [Courier::Resources::Auth]
    attr_reader :auth

    # Invoke a stored automation template or an ad hoc automation defined in the
    # request.
    # @return [Courier::Resources::Automations]
    attr_reader :automations

    # Build, version, publish, invoke, and cancel multi-step notification workflows,
    # along with the templates scoped to them.
    # @return [Courier::Resources::Journeys]
    attr_reader :journeys

    # Create a one-off send to a list or audience, author its content, then send it
    # immediately or schedule it for later.
    # @return [Courier::Resources::Broadcasts]
    attr_reader :broadcasts

    # @return [Courier::Resources::Bulk]
    attr_reader :bulk

    # Manage the logos, colors, and layout that give the templates you send a
    # consistent look.
    # @return [Courier::Resources::Brands]
    attr_reader :brands

    # @return [Courier::Resources::Digests]
    attr_reader :digests

    # Record an inbound event that triggers the journeys and automations mapped to it.
    # @return [Courier::Resources::Inbound]
    attr_reader :inbound

    # Manage static groups of users that you subscribe explicitly, and send to them by
    # list id or list pattern.
    # @return [Courier::Resources::Lists]
    attr_reader :lists

    # Look up the messages Courier has accepted, inspect their delivery history and
    # rendered output, and cancel, resend, or archive them.
    # @return [Courier::Resources::Messages]
    attr_reader :messages

    # Look up the messages Courier has accepted, inspect their delivery history and
    # rendered output, and cancel, resend, or archive them.
    # @return [Courier::Resources::Requests]
    attr_reader :requests

    # Create, update, version, publish, and localize notification templates and their
    # content.
    # @return [Courier::Resources::Notifications]
    attr_reader :notifications

    # Define reusable channel routing and failover strategies, and see which templates
    # use them.
    # @return [Courier::Resources::RoutingStrategies]
    attr_reader :routing_strategies

    # Manage the workspace catalog of subscription topics, the sections that group
    # them, and publishing the preference page.
    # @return [Courier::Resources::WorkspacePreferences]
    attr_reader :workspace_preferences

    # Store the contact information Courier delivers to for each user — email, phone
    # number, push tokens, and any custom data you send to.
    # @return [Courier::Resources::Profiles]
    attr_reader :profiles

    # Manage tenants — the organizations, teams, or accounts your users belong to —
    # along with their users and default preferences.
    # @return [Courier::Resources::Tenants]
    attr_reader :tenants

    # Store and retrieve the translation strings Courier uses to render localized
    # template content.
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

      headers = {}
      custom_headers_env = ENV["COURIER_CUSTOM_HEADERS"]
      unless custom_headers_env.nil?
        parsed = {}
        custom_headers_env.split("\n").each do |line|
          colon = line.index(":")
          unless colon.nil?
            parsed[line[0...colon].strip] = line[(colon + 1)..].strip
          end
        end
        headers = parsed.merge(headers)
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers
      )

      @send_ = Courier::Resources::Send.new(client: self)
      @audiences = Courier::Resources::Audiences.new(client: self)
      @providers = Courier::Resources::Providers.new(client: self)
      @audit_events = Courier::Resources::AuditEvents.new(client: self)
      @auth = Courier::Resources::Auth.new(client: self)
      @automations = Courier::Resources::Automations.new(client: self)
      @journeys = Courier::Resources::Journeys.new(client: self)
      @broadcasts = Courier::Resources::Broadcasts.new(client: self)
      @bulk = Courier::Resources::Bulk.new(client: self)
      @brands = Courier::Resources::Brands.new(client: self)
      @digests = Courier::Resources::Digests.new(client: self)
      @inbound = Courier::Resources::Inbound.new(client: self)
      @lists = Courier::Resources::Lists.new(client: self)
      @messages = Courier::Resources::Messages.new(client: self)
      @requests = Courier::Resources::Requests.new(client: self)
      @notifications = Courier::Resources::Notifications.new(client: self)
      @routing_strategies = Courier::Resources::RoutingStrategies.new(client: self)
      @workspace_preferences = Courier::Resources::WorkspacePreferences.new(client: self)
      @profiles = Courier::Resources::Profiles.new(client: self)
      @tenants = Courier::Resources::Tenants.new(client: self)
      @translations = Courier::Resources::Translations.new(client: self)
      @users = Courier::Resources::Users.new(client: self)
    end
  end
end
