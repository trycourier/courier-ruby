# typed: strong

module Courier
  module Models
    module Lists
      class RecipientPreferences < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Lists::RecipientPreferences,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::Lists::NotificationPreferenceDetails]
            )
          )
        end
        attr_accessor :categories

        sig do
          returns(
            T.nilable(
              T::Hash[Symbol, Courier::Lists::NotificationPreferenceDetails]
            )
          )
        end
        attr_accessor :notifications

        sig do
          params(
            categories:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::Lists::NotificationPreferenceDetails::OrHash
                ]
              ),
            notifications:
              T.nilable(
                T::Hash[
                  Symbol,
                  Courier::Lists::NotificationPreferenceDetails::OrHash
                ]
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
                  T::Hash[Symbol, Courier::Lists::NotificationPreferenceDetails]
                ),
              notifications:
                T.nilable(
                  T::Hash[Symbol, Courier::Lists::NotificationPreferenceDetails]
                )
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
