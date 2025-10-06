# typed: strong

module Courier
  module Models
    module Lists
      class PutSubscriptionsRecipient < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Lists::PutSubscriptionsRecipient,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :recipient_id

        sig { returns(T.nilable(Courier::Lists::RecipientPreferences)) }
        attr_reader :preferences

        sig do
          params(
            preferences: T.nilable(Courier::Lists::RecipientPreferences::OrHash)
          ).void
        end
        attr_writer :preferences

        sig do
          params(
            recipient_id: String,
            preferences: T.nilable(Courier::Lists::RecipientPreferences::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(recipient_id:, preferences: nil)
        end

        sig do
          override.returns(
            {
              recipient_id: String,
              preferences: T.nilable(Courier::Lists::RecipientPreferences)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
