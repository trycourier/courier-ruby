# typed: strong

module Courier
  module Models
    class PutSubscriptionsRecipient < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::PutSubscriptionsRecipient, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :recipient_id

      sig { returns(T.nilable(Courier::RecipientPreferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Courier::RecipientPreferences::OrHash)
        ).void
      end
      attr_writer :preferences

      sig do
        params(
          recipient_id: String,
          preferences: T.nilable(Courier::RecipientPreferences::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(recipient_id:, preferences: nil)
      end

      sig do
        override.returns(
          {
            recipient_id: String,
            preferences: T.nilable(Courier::RecipientPreferences)
          }
        )
      end
      def to_hash
      end
    end
  end
end
