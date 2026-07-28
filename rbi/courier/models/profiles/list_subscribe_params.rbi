# typed: strong

module Courier
  module Models
    module Profiles
      class ListSubscribeParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Profiles::ListSubscribeParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig { returns(T::Array[Courier::SubscribeToListsRequestItem]) }
        attr_accessor :lists

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig { returns(T.nilable(String)) }
        attr_reader :x_idempotency_expiration

        sig { params(x_idempotency_expiration: String).void }
        attr_writer :x_idempotency_expiration

        sig do
          params(
            user_id: String,
            lists: T::Array[Courier::SubscribeToListsRequestItem::OrHash],
            idempotency_key: String,
            x_idempotency_expiration: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
          lists:,
          idempotency_key: nil,
          x_idempotency_expiration: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              user_id: String,
              lists: T::Array[Courier::SubscribeToListsRequestItem],
              idempotency_key: String,
              x_idempotency_expiration: String,
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
