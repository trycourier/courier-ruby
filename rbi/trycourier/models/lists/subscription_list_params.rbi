# typed: strong

module Trycourier
  module Models
    module Lists
      class SubscriptionListParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Lists::SubscriptionListParams,
              Trycourier::Internal::AnyHash
            )
          end

        # A unique identifier that allows for fetching the next set of list subscriptions
        sig { returns(T.nilable(String)) }
        attr_accessor :cursor

        sig do
          params(
            cursor: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A unique identifier that allows for fetching the next set of list subscriptions
          cursor: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: T.nilable(String),
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
