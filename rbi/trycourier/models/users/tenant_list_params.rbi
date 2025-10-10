# typed: strong

module Trycourier
  module Models
    module Users
      class TenantListParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Users::TenantListParams,
              Trycourier::Internal::AnyHash
            )
          end

        # Continue the pagination with the next cursor
        sig { returns(T.nilable(String)) }
        attr_accessor :cursor

        # The number of accounts to return (defaults to 20, maximum value of 100)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :limit

        sig do
          params(
            cursor: T.nilable(String),
            limit: T.nilable(Integer),
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Continue the pagination with the next cursor
          cursor: nil,
          # The number of accounts to return (defaults to 20, maximum value of 100)
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: T.nilable(String),
              limit: T.nilable(Integer),
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
