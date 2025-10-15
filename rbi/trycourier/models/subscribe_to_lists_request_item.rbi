# typed: strong

module Trycourier
  module Models
    class SubscribeToListsRequestItem < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::SubscribeToListsRequestItem,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :list_id

      sig { returns(T.nilable(Trycourier::RecipientPreferences)) }
      attr_reader :preferences

      sig do
        params(
          preferences: T.nilable(Trycourier::RecipientPreferences::OrHash)
        ).void
      end
      attr_writer :preferences

      sig do
        params(
          list_id: String,
          preferences: T.nilable(Trycourier::RecipientPreferences::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(list_id:, preferences: nil)
      end

      sig do
        override.returns(
          {
            list_id: String,
            preferences: T.nilable(Trycourier::RecipientPreferences)
          }
        )
      end
      def to_hash
      end
    end
  end
end
