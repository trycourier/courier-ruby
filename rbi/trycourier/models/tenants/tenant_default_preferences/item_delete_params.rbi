# typed: strong

module Trycourier
  module Models
    module Tenants
      module TenantDefaultPreferences
        class ItemDeleteParams < Trycourier::Internal::Type::BaseModel
          extend Trycourier::Internal::Type::RequestParameters::Converter
          include Trycourier::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Trycourier::Tenants::TenantDefaultPreferences::ItemDeleteParams,
                Trycourier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :tenant_id

          sig do
            params(
              tenant_id: String,
              request_options: Trycourier::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(tenant_id:, request_options: {})
          end

          sig do
            override.returns(
              { tenant_id: String, request_options: Trycourier::RequestOptions }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
