# typed: strong

module Courier
  module Models
    module Lists
      class SubscriptionSubscribeParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Lists::SubscriptionSubscribeParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :list_id

        sig { returns(T::Array[Courier::PutSubscriptionsRecipient]) }
        attr_accessor :recipients

        sig do
          params(
            list_id: String,
            recipients: T::Array[Courier::PutSubscriptionsRecipient::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(list_id:, recipients:, request_options: {})
        end

        sig do
          override.returns(
            {
              list_id: String,
              recipients: T::Array[Courier::PutSubscriptionsRecipient],
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
