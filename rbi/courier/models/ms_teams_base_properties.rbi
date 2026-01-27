# typed: strong

module Courier
  module Models
    class MsTeamsBaseProperties < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::MsTeamsBaseProperties, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :service_url

      sig { returns(String) }
      attr_accessor :tenant_id

      sig do
        params(service_url: String, tenant_id: String).returns(T.attached_class)
      end
      def self.new(service_url:, tenant_id:)
      end

      sig { override.returns({ service_url: String, tenant_id: String }) }
      def to_hash
      end
    end
  end
end
