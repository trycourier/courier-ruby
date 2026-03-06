# typed: strong

module Courier
  module Models
    module Users
      class TenantListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Courier::Users::TenantListParams, Courier::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :user_id

        # Continue the pagination with the next cursor
        sig { returns(T.nilable(String)) }
        attr_accessor :cursor

        # The number of accounts to return (defaults to 20, maximum value of 100)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :limit

        sig do
          params(
            user_id: String,
            cursor: T.nilable(String),
            limit: T.nilable(Integer),
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          user_id:,
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
              user_id: String,
              cursor: T.nilable(String),
              limit: T.nilable(Integer),
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
