# typed: strong

module Trycourier
  module Models
    module Lists
      class SubscriptionListResponse < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::Lists::SubscriptionListResponse,
              Trycourier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[Trycourier::Models::Lists::SubscriptionListResponse::Item]
          )
        end
        attr_accessor :items

        sig { returns(Trycourier::Paging) }
        attr_reader :paging

        sig { params(paging: Trycourier::Paging::OrHash).void }
        attr_writer :paging

        sig do
          params(
            items:
              T::Array[
                Trycourier::Models::Lists::SubscriptionListResponse::Item::OrHash
              ],
            paging: Trycourier::Paging::OrHash
          ).returns(T.attached_class)
        end
        def self.new(items:, paging:)
        end

        sig do
          override.returns(
            {
              items:
                T::Array[
                  Trycourier::Models::Lists::SubscriptionListResponse::Item
                ],
              paging: Trycourier::Paging
            }
          )
        end
        def to_hash
        end

        class Item < Trycourier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Trycourier::Models::Lists::SubscriptionListResponse::Item,
                Trycourier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :recipient_id

          sig { returns(T.nilable(String)) }
          attr_accessor :created

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
              recipient_id: String,
              created: T.nilable(String),
              preferences: T.nilable(Trycourier::RecipientPreferences::OrHash)
            ).returns(T.attached_class)
          end
          def self.new(recipient_id:, created: nil, preferences: nil)
          end

          sig do
            override.returns(
              {
                recipient_id: String,
                created: T.nilable(String),
                preferences: T.nilable(Trycourier::RecipientPreferences)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
