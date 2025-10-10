# typed: strong

module Trycourier
  module Models
    module Lists
      class SubscriptionAddParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Lists::SubscriptionAddParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Trycourier::PutSubscriptionsRecipient]) }
        attr_accessor :recipients

        sig do
          params(
            recipients: T::Array[Trycourier::PutSubscriptionsRecipient::OrHash],
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(recipients:, request_options: {})
        end

        sig do
          override.returns(
            {
              recipients: T::Array[Trycourier::PutSubscriptionsRecipient],
              request_options: Trycourier::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
