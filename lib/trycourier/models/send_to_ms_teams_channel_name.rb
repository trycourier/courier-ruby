# frozen_string_literal: true

module Trycourier
  module Models
    class SendToMsTeamsChannelName < Trycourier::Internal::Type::BaseModel
      # @!attribute channel_name
      #
      #   @return [String]
      required :channel_name, String

      # @!attribute service_url
      #
      #   @return [String]
      required :service_url, String

      # @!attribute team_id
      #
      #   @return [String]
      required :team_id, String

      # @!attribute tenant_id
      #
      #   @return [String]
      required :tenant_id, String

      # @!method initialize(channel_name:, service_url:, team_id:, tenant_id:)
      #   @param channel_name [String]
      #   @param service_url [String]
      #   @param team_id [String]
      #   @param tenant_id [String]
    end
  end
end
