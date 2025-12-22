# typed: strong

module Trycourier
  module Models
    class SendToMsTeamsChannelName < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::SendToMsTeamsChannelName,
            Trycourier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :channel_name

      sig { returns(String) }
      attr_accessor :service_url

      sig { returns(String) }
      attr_accessor :team_id

      sig { returns(String) }
      attr_accessor :tenant_id

      sig do
        params(
          channel_name: String,
          service_url: String,
          team_id: String,
          tenant_id: String
        ).returns(T.attached_class)
      end
      def self.new(channel_name:, service_url:, team_id:, tenant_id:)
      end

      sig do
        override.returns(
          {
            channel_name: String,
            service_url: String,
            team_id: String,
            tenant_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
