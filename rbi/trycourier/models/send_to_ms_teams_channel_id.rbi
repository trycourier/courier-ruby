# typed: strong

module Trycourier
  module Models
    class SendToMsTeamsChannelID < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::SendToMsTeamsChannelID,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :channel_id

      sig { returns(String) }
      attr_accessor :service_url

      sig { returns(String) }
      attr_accessor :tenant_id

      sig do
        params(
          channel_id: String,
          service_url: String,
          tenant_id: String
        ).returns(T.attached_class)
      end
      def self.new(channel_id:, service_url:, tenant_id:)
      end

      sig do
        override.returns(
          { channel_id: String, service_url: String, tenant_id: String }
        )
      end
      def to_hash
      end
    end
  end
end
