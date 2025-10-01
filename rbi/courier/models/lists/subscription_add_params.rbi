# typed: strong

module Courier
  module Models
    module Lists
      class SubscriptionAddParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Lists::SubscriptionAddParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Courier::Lists::PutSubscriptionsRecipient]) }
        attr_accessor :recipients

        sig do
          params(
            recipients:
              T::Array[Courier::Lists::PutSubscriptionsRecipient::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(recipients:, request_options: {})
        end

        sig do
          override.returns(
            {
              recipients: T::Array[Courier::Lists::PutSubscriptionsRecipient],
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
