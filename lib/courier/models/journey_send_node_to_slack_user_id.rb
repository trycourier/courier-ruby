# frozen_string_literal: true

module Courier
  module Models
    class JourneySendNodeToSlackUserID < Courier::Internal::Type::BaseModel
      # @!attribute user_id
      #   Slack user ID to send to.
      #
      #   @return [String]
      required :user_id, String

      # @!attribute access_token
      #   A runtime reference to a Slack access token, such as `{{data.slack_token}}`.
      #   Literal values are rejected — they'd be stored permanently with no way to rotate
      #   them. Omit to use the token on the recipient's stored Slack profile.
      #
      #   @return [String, nil]
      optional :access_token, String

      # @!method initialize(user_id:, access_token: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneySendNodeToSlackUserID} for more details.
      #
      #   @param user_id [String] Slack user ID to send to.
      #
      #   @param access_token [String] A runtime reference to a Slack access token, such as `{{data.slack_token}}`. Lit
    end
  end
end
