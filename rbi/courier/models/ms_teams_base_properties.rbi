# typed: strong

module Courier
  module Models
    class MsTeamsBaseProperties < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::MsTeamsBaseProperties, Courier::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :service_url

      sig { params(service_url: String).void }
      attr_writer :service_url

      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      # Tenant context shared by every MS Teams send variant. Provide at least one of
      # `tenant_id` or `service_url`. If you provide both, they must agree — a
      # `service_url` pointing at a different Microsoft tenant than `tenant_id` is
      # rejected.
      sig do
        params(service_url: String, tenant_id: String).returns(T.attached_class)
      end
      def self.new(service_url: nil, tenant_id: nil)
      end

      sig { override.returns({ service_url: String, tenant_id: String }) }
      def to_hash
      end
    end
  end
end
