# typed: strong

module Courier
  module Models
    module Tenants
      module DefaultPreferences
        class ItemUpdateParams < Courier::Models::SubscriptionTopicNew
          extend Courier::Internal::Type::RequestParameters::Converter
          include Courier::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Courier::Tenants::DefaultPreferences::ItemUpdateParams,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :tenant_id

          sig do
            params(
              tenant_id: String,
              request_options: Courier::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(tenant_id:, request_options: {})
          end

          sig do
            override.returns(
              { tenant_id: String, request_options: Courier::RequestOptions }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
