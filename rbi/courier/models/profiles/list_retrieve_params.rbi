# typed: strong

module Courier
  module Models
    module Profiles
      class ListRetrieveParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Profiles::ListRetrieveParams,
              Courier::Internal::AnyHash
            )
          end

        # A unique identifier that allows for fetching the next set of message statuses.
        sig { returns(T.nilable(String)) }
        attr_accessor :cursor

        sig do
          params(
            cursor: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A unique identifier that allows for fetching the next set of message statuses.
          cursor: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
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
