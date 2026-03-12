# typed: strong

module Courier
  module Models
    module Lists
      class SubscriptionListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Lists::SubscriptionListParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :list_id

        # A unique identifier that allows for fetching the next set of list subscriptions
        sig { returns(T.nilable(String)) }
        attr_accessor :cursor

        sig do
          params(
            list_id: String,
            cursor: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          list_id:,
          # A unique identifier that allows for fetching the next set of list subscriptions
          cursor: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              list_id: String,
              cursor: T.nilable(String),
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
