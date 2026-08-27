# typed: strong

module Courier
  module Models
    class SendToMsTeamsChannelName < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::SendToMsTeamsChannelName, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :channel_name

      sig { returns(String) }
      attr_accessor :team_id

      sig { returns(T.nilable(String)) }
      attr_reader :service_url

      sig { params(service_url: String).void }
      attr_writer :service_url

      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      # `team_id` is required alongside `channel_name`. Also provide at least one of
      # `tenant_id` or `service_url`; if you provide both, they must agree.
      sig do
        params(
          channel_name: String,
          team_id: String,
          service_url: String,
          tenant_id: String
        ).returns(T.attached_class)
      end
      def self.new(channel_name:, team_id:, service_url: nil, tenant_id: nil)
      end

      sig do
        override.returns(
          {
            channel_name: String,
            team_id: String,
            service_url: String,
            tenant_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
