# frozen_string_literal: true

module Trycourier
  module Models
    class SendToMsTeamsChannelID < Trycourier::Internal::Type::BaseModel
      # @!attribute channel_id
      #
      #   @return [String]
      required :channel_id, String

      # @!attribute service_url
      #
      #   @return [String]
      required :service_url, String

      # @!attribute tenant_id
      #
      #   @return [String]
      required :tenant_id, String

      # @!method initialize(channel_id:, service_url:, tenant_id:)
      #   @param channel_id [String]
      #   @param service_url [String]
      #   @param tenant_id [String]
    end
  end
end
