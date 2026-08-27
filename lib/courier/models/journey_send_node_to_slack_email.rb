# frozen_string_literal: true

module Courier
  module Models
    class JourneySendNodeToSlackEmail < Courier::Internal::Type::BaseModel
      # @!attribute email
      #   Email address of the Slack user to send to, resolved via the workspace
      #   directory.
      #
      #   @return [String]
      required :email, String

      # @!attribute access_token
      #   A runtime reference to a Slack access token, such as `{{data.slack_token}}`.
      #   Literal values are rejected — they'd be stored permanently with no way to rotate
      #   them. Omit to use the token on the recipient's stored Slack profile.
      #
      #   @return [String, nil]
      optional :access_token, String

      # @!method initialize(email:, access_token: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneySendNodeToSlackEmail} for more details.
      #
      #   @param email [String] Email address of the Slack user to send to, resolved via the workspace directory
      #
      #   @param access_token [String] A runtime reference to a Slack access token, such as `{{data.slack_token}}`. Lit
    end
  end
end
