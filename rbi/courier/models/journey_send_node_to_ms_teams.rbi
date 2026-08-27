# typed: strong

module Courier
  module Models
    class JourneySendNodeToMsTeams < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneySendNodeToMsTeams, Courier::Internal::AnyHash)
        end

      # Bot Framework channel ID to send to.
      sig { returns(T.nilable(String)) }
      attr_reader :channel_id

      sig { params(channel_id: String).void }
      attr_writer :channel_id

      # Teams channel name to send to. Requires `team_id`.
      sig { returns(T.nilable(String)) }
      attr_reader :channel_name

      sig { params(channel_name: String).void }
      attr_writer :channel_name

      # Email address of the Teams user to send to.
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # The regional Bot Framework host for this conversation, e.g.
      # `https://smba.trafficmanager.net/amer`. A path segment naming the Microsoft
      # tenant may follow it and is used to derive `tenant_id` when it is not supplied
      # directly.
      sig { returns(T.nilable(String)) }
      attr_reader :service_url

      sig { params(service_url: String).void }
      attr_writer :service_url

      # Microsoft Teams team ID. Required alongside `channel_name`.
      sig { returns(T.nilable(String)) }
      attr_reader :team_id

      sig { params(team_id: String).void }
      attr_writer :team_id

      # The Microsoft (Azure AD) tenant this send targets or authenticates against.
      # Unrelated to `message.context.tenant_id`, which is the Courier customer's own
      # multi-tenant context.
      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      # Microsoft Teams user ID to send to.
      sig { returns(T.nilable(String)) }
      attr_reader :user_id

      sig { params(user_id: String).void }
      attr_writer :user_id

      # Send to a Microsoft Teams address directly, bypassing the recipient's stored
      # profile. Requires exactly one target: `channel_id`, `channel_name` (with
      # `team_id`), `user_id`, or `email`. `channel_name`, `user_id`, and `email` also
      # need at least one of `service_url` or `tenant_id` — if you provide both, they
      # must agree. `channel_id` doesn't require tenant context to publish, but provide
      # `service_url` or `tenant_id` anyway: sends without either have failed at
      # delivery in testing. `conversation_id` and `reply_to_activity_id`, available on
      # the send API's `MsTeams` profile, aren't supported here yet.
      sig do
        params(
          channel_id: String,
          channel_name: String,
          email: String,
          service_url: String,
          team_id: String,
          tenant_id: String,
          user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Bot Framework channel ID to send to.
        channel_id: nil,
        # Teams channel name to send to. Requires `team_id`.
        channel_name: nil,
        # Email address of the Teams user to send to.
        email: nil,
        # The regional Bot Framework host for this conversation, e.g.
        # `https://smba.trafficmanager.net/amer`. A path segment naming the Microsoft
        # tenant may follow it and is used to derive `tenant_id` when it is not supplied
        # directly.
        service_url: nil,
        # Microsoft Teams team ID. Required alongside `channel_name`.
        team_id: nil,
        # The Microsoft (Azure AD) tenant this send targets or authenticates against.
        # Unrelated to `message.context.tenant_id`, which is the Courier customer's own
        # multi-tenant context.
        tenant_id: nil,
        # Microsoft Teams user ID to send to.
        user_id: nil
      )
      end

      sig do
        override.returns(
          {
            channel_id: String,
            channel_name: String,
            email: String,
            service_url: String,
            team_id: String,
            tenant_id: String,
            user_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
