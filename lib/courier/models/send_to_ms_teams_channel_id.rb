# frozen_string_literal: true

module Courier
  module Models
    class SendToMsTeamsChannelID < Courier::Internal::Type::BaseModel
      # @!attribute channel_id
      #
      #   @return [String]
      required :channel_id, String

      # @!attribute service_url
      #
      #   @return [String, nil]
      optional :service_url, String

      # @!attribute tenant_id
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!method initialize(channel_id:, service_url: nil, tenant_id: nil)
      #   Sends directly to a Microsoft Teams channel by its Bot Framework ID. Still
      #   provide at least one of `tenant_id` or `service_url` — sends without either have
      #   failed Bot Framework authentication in testing.
      #
      #   @param channel_id [String]
      #   @param service_url [String]
      #   @param tenant_id [String]
    end
  end
end
