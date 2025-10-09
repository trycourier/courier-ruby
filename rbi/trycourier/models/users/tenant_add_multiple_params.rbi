# typed: strong

module Trycourier
  module Models
    module Users
      class TenantAddMultipleParams < Trycourier::Internal::Type::BaseModel
        extend Trycourier::Internal::Type::RequestParameters::Converter
        include Trycourier::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Users::TenantAddMultipleParams,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Trycourier::TenantAssociation]) }
        attr_accessor :tenants

        sig do
          params(
            tenants: T::Array[Trycourier::TenantAssociation::OrHash],
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(tenants:, request_options: {})
        end

        sig do
          override.returns(
            {
              tenants: T::Array[Trycourier::TenantAssociation],
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
