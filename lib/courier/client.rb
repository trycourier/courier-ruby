# frozen_string_literal: true

module Courier
  class Client
    # @return [Courier::Client]
    def initialize(base_url:, token: ENV.fetch("COURIER_AUTH_TOKEN", nil))
      @raw_client = Courier::Internal::Http::RawClient.new(
        base_url: base_url,
        headers: {
          "User-Agent": "trycourier/3.4.0",
          "X-Fern-Language": "Ruby",
          Authorization: "Bearer #{token}"
        }
      )
    end

    # @return [Courier::Audiences::Client]
    def audiences
      @audiences ||= Courier::Audiences::Client.new(client: @raw_client)
    end

    # @return [Courier::AuditEvents::Client]
    def audit_events
      @audit_events ||= Courier::AuditEvents::Client.new(client: @raw_client)
    end

    # @return [Courier::AuthTokens::Client]
    def auth_tokens
      @auth_tokens ||= Courier::AuthTokens::Client.new(client: @raw_client)
    end

    # @return [Courier::Automations::Client]
    def automations
      @automations ||= Courier::Automations::Client.new(client: @raw_client)
    end

    # @return [Courier::Brands::Client]
    def brands
      @brands ||= Courier::Brands::Client.new(client: @raw_client)
    end

    # @return [Courier::Bulk::Client]
    def bulk
      @bulk ||= Courier::Bulk::Client.new(client: @raw_client)
    end

    # @return [Courier::Inbound::Client]
    def inbound
      @inbound ||= Courier::Inbound::Client.new(client: @raw_client)
    end

    # @return [Courier::Lists::Client]
    def lists
      @lists ||= Courier::Lists::Client.new(client: @raw_client)
    end

    # @return [Courier::Messages::Client]
    def messages
      @messages ||= Courier::Messages::Client.new(client: @raw_client)
    end

    # @return [Courier::Notifications::Client]
    def notifications
      @notifications ||= Courier::Notifications::Client.new(client: @raw_client)
    end

    # @return [Courier::Profiles::Client]
    def profiles
      @profiles ||= Courier::Profiles::Client.new(client: @raw_client)
    end

    # @return [Courier::Templates::Client]
    def templates
      @templates ||= Courier::Templates::Client.new(client: @raw_client)
    end

    # @return [Courier::Tenants::Client]
    def tenants
      @tenants ||= Courier::Tenants::Client.new(client: @raw_client)
    end

    # @return [Courier::Translations::Client]
    def translations
      @translations ||= Courier::Translations::Client.new(client: @raw_client)
    end

    # @return [Courier::Users::Client]
    def users
      @users ||= Courier::Users::Client.new(client: @raw_client)
    end
  end
end
