# frozen_string_literal: true

module Courier
  module Models
    class JourneySendNodeToSlackChannel < Courier::Internal::Type::BaseModel
      # @!attribute channel
      #   Slack channel to send to, by name or ID.
      #
      #   @return [String]
      required :channel, String

      # @!attribute access_token
      #   A runtime reference to a Slack access token, such as `{{data.slack_token}}`.
      #   Literal values are rejected — they'd be stored permanently with no way to rotate
      #   them. Omit to use the token on the recipient's stored Slack profile.
      #
      #   @return [String, nil]
      optional :access_token, String

      # @!method initialize(channel:, access_token: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneySendNodeToSlackChannel} for more details.
      #
      #   @param channel [String] Slack channel to send to, by name or ID.
      #
      #   @param access_token [String] A runtime reference to a Slack access token, such as `{{data.slack_token}}`. Lit
    end
  end
end
