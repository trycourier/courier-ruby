# typed: strong

module Trycourier
  module Models
    class SendToMsTeamsEmail < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::SendToMsTeamsEmail, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :email

      sig { returns(String) }
      attr_accessor :service_url

      sig { returns(String) }
      attr_accessor :tenant_id

      sig do
        params(email: String, service_url: String, tenant_id: String).returns(
          T.attached_class
        )
      end
      def self.new(email:, service_url:, tenant_id:)
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
