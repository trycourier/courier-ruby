# typed: strong

module Courier
  module Models
    module Lists
      class SubscriptionListResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Lists::SubscriptionListResponse,
              Courier::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[Courier::Models::Lists::SubscriptionListResponse::Item]
          )
        end
        attr_accessor :items

        sig { returns(Courier::Paging) }
        attr_reader :paging

        sig { params(paging: Courier::Paging::OrHash).void }
        attr_writer :paging

        sig do
          params(
            items:
              T::Array[
                Courier::Models::Lists::SubscriptionListResponse::Item::OrHash
              ],
            paging: Courier::Paging::OrHash
          ).returns(T.attached_class)
        end
        def self.new(items:, paging:)
        end

        sig do
          override.returns(
            {
              items:
                T::Array[
                  Courier::Models::Lists::SubscriptionListResponse::Item
                ],
              paging: Courier::Paging
            }
          )
        end
        def to_hash
        end

        class Item < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Models::Lists::SubscriptionListResponse::Item,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :recipient_id

          sig { returns(T.nilable(String)) }
          attr_accessor :created

          sig { returns(T.nilable(Courier::Lists::RecipientPreferences)) }
          attr_reader :preferences

          sig do
            params(
              preferences:
                T.nilable(Courier::Lists::RecipientPreferences::OrHash)
            ).void
          end
          attr_writer :preferences

          sig do
            params(
              recipient_id: String,
              created: T.nilable(String),
              preferences:
                T.nilable(Courier::Lists::RecipientPreferences::OrHash)
            ).returns(T.attached_class)
          end
          def self.new(recipient_id:, created: nil, preferences: nil)
          end

          sig do
            override.returns(
              {
                recipient_id: String,
                created: T.nilable(String),
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
end
