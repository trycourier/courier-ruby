# typed: strong

module Trycourier
  module Models
    module Lists
      class SubscriptionUnsubscribeUserParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Lists::SubscriptionUnsubscribeUserParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :list_id

        sig do
          params(
            list_id: String,
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(list_id:, request_options: {})
        end

        sig do
          override.returns(
            { list_id: String, request_options: Trycourier::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
