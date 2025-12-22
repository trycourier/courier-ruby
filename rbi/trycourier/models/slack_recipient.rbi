# typed: strong

module Trycourier
  module Models
    class SlackRecipient < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::SlackRecipient, Trycourier::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            Trycourier::SendToSlackChannel,
            Trycourier::SendToSlackEmail,
            Trycourier::SendToSlackUserID
          )
        )
      end
      attr_accessor :slack

      # Send via Slack (channel, email, or user_id)
      sig do
        params(
          slack:
            T.any(
              Trycourier::SendToSlackChannel::OrHash,
              Trycourier::SendToSlackEmail::OrHash,
              Trycourier::SendToSlackUserID::OrHash
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
                Trycourier::SendToSlackChannel,
                Trycourier::SendToSlackEmail,
                Trycourier::SendToSlackUserID
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end
