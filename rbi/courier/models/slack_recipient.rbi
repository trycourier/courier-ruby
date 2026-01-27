# typed: strong

module Courier
  module Models
    class SlackRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::SlackRecipient, Courier::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            Courier::SendToSlackChannel,
            Courier::SendToSlackEmail,
            Courier::SendToSlackUserID
          )
        )
      end
      attr_accessor :slack

      # Send via Slack (channel, email, or user_id)
      sig do
        params(
          slack:
            T.any(
              Courier::SendToSlackChannel::OrHash,
              Courier::SendToSlackEmail::OrHash,
              Courier::SendToSlackUserID::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(slack:)
      end

      sig do
        override.returns(
          {
            slack:
              T.any(
                Courier::SendToSlackChannel,
                Courier::SendToSlackEmail,
                Courier::SendToSlackUserID
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end
