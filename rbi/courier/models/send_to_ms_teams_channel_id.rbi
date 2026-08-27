# typed: strong

module Courier
  module Models
    class SendToMsTeamsChannelID < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::SendToMsTeamsChannelID, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :channel_id

      sig { returns(T.nilable(String)) }
      attr_reader :service_url

      sig { params(service_url: String).void }
      attr_writer :service_url

      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      # Sends directly to a Microsoft Teams channel by its Bot Framework ID. Still
      # provide at least one of `tenant_id` or `service_url` — sends without either have
      # failed Bot Framework authentication in testing.
      sig do
        params(
          channel_id: String,
          service_url: String,
          tenant_id: String
        ).returns(T.attached_class)
      end
      def self.new(channel_id:, service_url: nil, tenant_id: nil)
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
