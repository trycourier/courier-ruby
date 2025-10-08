# typed: strong

module Courier
  module Models
    module Lists
      class SubscriptionSubscribeUserParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Lists::SubscriptionSubscribeUserParams,
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
            preferences: T.nilable(Courier::RecipientPreferences::OrHash),
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(list_id:, preferences: nil, request_options: {})
        end

        sig do
          override.returns(
            {
              list_id: String,
              preferences: T.nilable(Courier::RecipientPreferences),
              request_options: Courier::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
