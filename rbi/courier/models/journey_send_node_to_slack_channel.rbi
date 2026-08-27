# typed: strong

module Courier
  module Models
    class JourneySendNodeToSlackChannel < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::JourneySendNodeToSlackChannel,
            Courier::Internal::AnyHash
          )
        end

      # Slack channel to send to, by name or ID.
      sig { returns(String) }
      attr_accessor :channel

      # A runtime reference to a Slack access token, such as `{{data.slack_token}}`.
      # Literal values are rejected — they'd be stored permanently with no way to rotate
      # them. Omit to use the token on the recipient's stored Slack profile.
      sig { returns(T.nilable(String)) }
      attr_reader :access_token

      sig { params(access_token: String).void }
      attr_writer :access_token

      sig do
        params(channel: String, access_token: String).returns(T.attached_class)
      end
      def self.new(
        # Slack channel to send to, by name or ID.
        channel:,
        # A runtime reference to a Slack access token, such as `{{data.slack_token}}`.
        # Literal values are rejected — they'd be stored permanently with no way to rotate
        # them. Omit to use the token on the recipient's stored Slack profile.
        access_token: nil
      )
      end

      sig { override.returns({ channel: String, access_token: String }) }
      def to_hash
      end
    end
  end
end
