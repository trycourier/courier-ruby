# typed: strong

module Trycourier
  module Models
    module Profiles
      class ListRetrieveParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Profiles::ListRetrieveParams,
              Trycourier::Internal::AnyHash
            )
          end

        # A unique identifier that allows for fetching the next set of message statuses.
        sig { returns(T.nilable(String)) }
        attr_accessor :cursor

        sig do
          params(
            cursor: T.nilable(String),
            request_options: Trycourier::RequestOptions::OrHash
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
