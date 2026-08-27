# frozen_string_literal: true

module Courier
  module Models
    class JourneySendNodeToMsTeams < Courier::Internal::Type::BaseModel
      # @!attribute channel_id
      #   Bot Framework channel ID to send to.
      #
      #   @return [String, nil]
      optional :channel_id, String

      # @!attribute channel_name
      #   Teams channel name to send to. Requires `team_id`.
      #
      #   @return [String, nil]
      optional :channel_name, String

      # @!attribute email
      #   Email address of the Teams user to send to.
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute service_url
      #   The regional Bot Framework host for this conversation, e.g.
      #   `https://smba.trafficmanager.net/amer`. A path segment naming the Microsoft
      #   tenant may follow it and is used to derive `tenant_id` when it is not supplied
      #   directly.
      #
      #   @return [String, nil]
      optional :service_url, String

      # @!attribute team_id
      #   Microsoft Teams team ID. Required alongside `channel_name`.
      #
      #   @return [String, nil]
      optional :team_id, String

      # @!attribute tenant_id
      #   The Microsoft (Azure AD) tenant this send targets or authenticates against.
      #   Unrelated to `message.context.tenant_id`, which is the Courier customer's own
      #   multi-tenant context.
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!attribute user_id
      #   Microsoft Teams user ID to send to.
      #
      #   @return [String, nil]
      optional :user_id, String

      # @!method initialize(channel_id: nil, channel_name: nil, email: nil, service_url: nil, team_id: nil, tenant_id: nil, user_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneySendNodeToMsTeams} for more details.
      #
      #   Send to a Microsoft Teams address directly, bypassing the recipient's stored
      #   profile. Requires exactly one target: `channel_id`, `channel_name` (with
      #   `team_id`), `user_id`, or `email`. `channel_name`, `user_id`, and `email` also
      #   need at least one of `service_url` or `tenant_id` — if you provide both, they
      #   must agree. `channel_id` doesn't require tenant context to publish, but provide
      #   `service_url` or `tenant_id` anyway: sends without either have failed at
      #   delivery in testing. `conversation_id` and `reply_to_activity_id`, available on
      #   the send API's `MsTeams` profile, aren't supported here yet.
      #
      #   @param channel_id [String] Bot Framework channel ID to send to.
      #
      #   @param channel_name [String] Teams channel name to send to. Requires `team_id`.
      #
      #   @param email [String] Email address of the Teams user to send to.
      #
      #   @param service_url [String] The regional Bot Framework host for this conversation, e.g. `https://smba.traffi
      #
      #   @param team_id [String] Microsoft Teams team ID. Required alongside `channel_name`.
      #
      #   @param tenant_id [String] The Microsoft (Azure AD) tenant this send targets or authenticates against. Unre
      #
      #   @param user_id [String] Microsoft Teams user ID to send to.
    end
  end
end
