# typed: strong

module Trycourier
  module Models
    class RecipientPreferences < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::RecipientPreferences, Trycourier::Internal::AnyHash)
        end

      sig do
        returns(
          T.nilable(T::Hash[Symbol, Trycourier::NotificationPreferenceDetails])
        )
      end
      attr_accessor :categories

      sig do
        returns(
          T.nilable(T::Hash[Symbol, Trycourier::NotificationPreferenceDetails])
        )
      end
      attr_accessor :notifications

      sig do
        params(
          categories:
            T.nilable(
              T::Hash[Symbol, Trycourier::NotificationPreferenceDetails::OrHash]
            ),
          notifications:
            T.nilable(
              T::Hash[Symbol, Trycourier::NotificationPreferenceDetails::OrHash]
            )
        ).returns(T.attached_class)
      end
      def self.new(categories: nil, notifications: nil)
      end

      sig do
        override.returns(
          {
            categories:
              T.nilable(
                T::Hash[Symbol, Trycourier::NotificationPreferenceDetails]
              ),
            notifications:
              T.nilable(
                T::Hash[Symbol, Trycourier::NotificationPreferenceDetails]
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end
