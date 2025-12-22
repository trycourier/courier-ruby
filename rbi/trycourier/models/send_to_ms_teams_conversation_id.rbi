# typed: strong

module Trycourier
  module Models
    class SendToMsTeamsConversationID < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::SendToMsTeamsConversationID,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :conversation_id

      sig { returns(String) }
      attr_accessor :service_url

      sig { returns(String) }
      attr_accessor :tenant_id

      sig do
        params(
          conversation_id: String,
          service_url: String,
          tenant_id: String
        ).returns(T.attached_class)
      end
      def self.new(conversation_id:, service_url:, tenant_id:)
      end

      sig do
        override.returns(
          { conversation_id: String, service_url: String, tenant_id: String }
        )
      end
      def to_hash
      end
    end
  end
end
