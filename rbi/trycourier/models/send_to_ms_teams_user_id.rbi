# typed: strong

module Trycourier
  module Models
    class SendToMsTeamsUserID < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::SendToMsTeamsUserID, Trycourier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :service_url

      sig { returns(String) }
      attr_accessor :tenant_id

      sig { returns(String) }
      attr_accessor :user_id

      sig do
        params(service_url: String, tenant_id: String, user_id: String).returns(
          T.attached_class
        )
      end
      def self.new(service_url:, tenant_id:, user_id:)
      end

      sig do
        override.returns(
          { service_url: String, tenant_id: String, user_id: String }
        )
      end
      def to_hash
      end
    end
  end
end
