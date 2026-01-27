# typed: strong

module Courier
  module Models
    class SubscribeToListsRequestItem < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::SubscribeToListsRequestItem,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :list_id

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
          list_id: String,
          preferences: T.nilable(Courier::RecipientPreferences::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(list_id:, preferences: nil)
      end

      sig do
        override.returns(
          {
            list_id: String,
            preferences: T.nilable(Courier::RecipientPreferences)
          }
        )
      end
      def to_hash
      end
    end
  end
end
