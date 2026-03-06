# typed: strong

module Courier
  module Models
    module Users
      class TenantAddMultipleParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Courier::Users::TenantAddMultipleParams,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :user_id

        sig { returns(T::Array[Courier::TenantAssociation]) }
        attr_accessor :tenants

        sig do
          params(
            user_id: String,
            tenants: T::Array[Courier::TenantAssociation::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(user_id:, tenants:, request_options: {})
        end

        sig do
          override.returns(
            {
              user_id: String,
              tenants: T::Array[Courier::TenantAssociation],
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
