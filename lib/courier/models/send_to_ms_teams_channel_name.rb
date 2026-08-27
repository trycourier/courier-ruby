# frozen_string_literal: true

module Courier
  module Models
    class SendToMsTeamsChannelName < Courier::Internal::Type::BaseModel
      # @!attribute channel_name
      #
      #   @return [String]
      required :channel_name, String

      # @!attribute team_id
      #
      #   @return [String]
      required :team_id, String

      # @!attribute service_url
      #
      #   @return [String, nil]
      optional :service_url, String

      # @!attribute tenant_id
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!method initialize(channel_name:, team_id:, service_url: nil, tenant_id: nil)
      #   `team_id` is required alongside `channel_name`. Also provide at least one of
      #   `tenant_id` or `service_url`; if you provide both, they must agree.
      #
      #   @param channel_name [String]
      #   @param team_id [String]
      #   @param service_url [String]
      #   @param tenant_id [String]
    end
  end
end
