# typed: strong

module Courier
  module Models
    class JourneySendNodeToSlackUserID < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::JourneySendNodeToSlackUserID,
            Courier::Internal::AnyHash
          )
        end

      # Slack user ID to send to.
      sig { returns(String) }
      attr_accessor :user_id

      # A runtime reference to a Slack access token, such as `{{data.slack_token}}`.
      # Literal values are rejected — they'd be stored permanently with no way to rotate
      # them. Omit to use the token on the recipient's stored Slack profile.
      sig { returns(T.nilable(String)) }
      attr_reader :access_token

      sig { params(access_token: String).void }
      attr_writer :access_token

      sig do
        params(user_id: String, access_token: String).returns(T.attached_class)
      end
      def self.new(
        # Slack user ID to send to.
        user_id:,
        # A runtime reference to a Slack access token, such as `{{data.slack_token}}`.
        # Literal values are rejected — they'd be stored permanently with no way to rotate
        # them. Omit to use the token on the recipient's stored Slack profile.
        access_token: nil
      )
      end

      sig { override.returns({ user_id: String, access_token: String }) }
      def to_hash
      end
    end
  end
end
