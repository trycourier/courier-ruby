# typed: strong

module Courier
  module Models
    module Users
      class TenantAddSingleParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Users::TenantAddSingleParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :profile

        sig do
          params(
            user_id: String,
            profile: T.nilable(T::Hash[Symbol, T.anything]),
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(user_id:, profile: nil, request_options: {})
        end

        sig do
          override.returns(
            {
              user_id: String,
              profile: T.nilable(T::Hash[Symbol, T.anything]),
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
