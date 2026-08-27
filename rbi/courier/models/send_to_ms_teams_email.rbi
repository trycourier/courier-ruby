# typed: strong

module Courier
  module Models
    class SendToMsTeamsEmail < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::SendToMsTeamsEmail, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :email

      sig { returns(T.nilable(String)) }
      attr_reader :service_url

      sig { params(service_url: String).void }
      attr_writer :service_url

      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      # Provide at least one of `tenant_id` or `service_url`. If you provide both, they
      # must agree.
      sig do
        params(email: String, service_url: String, tenant_id: String).returns(
          T.attached_class
        )
      end
      def self.new(email:, service_url: nil, tenant_id: nil)
      end

      sig do
        override.returns(
          { email: String, service_url: String, tenant_id: String }
        )
      end
      def to_hash
      end
    end
  end
end
