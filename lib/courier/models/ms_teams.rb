# frozen_string_literal: true

module Courier
  module Models
    # Provide at least one of `tenant_id` or `service_url`. If you provide both, they
    # must agree.
    module MsTeams
      extend Courier::Internal::Type::Union

      # Provide at least one of `tenant_id` or `service_url`. If you provide both, they must agree.
      variant -> { Courier::SendToMsTeamsUserID }

      # Provide at least one of `tenant_id` or `service_url`. If you provide both, they must agree.
      variant -> { Courier::SendToMsTeamsEmail }

      # Sends directly to a Microsoft Teams channel by its Bot Framework ID. Still provide at least one of `tenant_id` or `service_url` — sends without either have failed Bot Framework authentication in testing.
      variant -> { Courier::SendToMsTeamsChannelID }

      variant -> { Courier::SendToMsTeamsConversationID }

      # `team_id` is required alongside `channel_name`. Also provide at least one of `tenant_id` or `service_url`; if you provide both, they must agree.
      variant -> { Courier::SendToMsTeamsChannelName }

      # @!method self.variants
      #   @return [Array(Courier::Models::SendToMsTeamsUserID, Courier::Models::SendToMsTeamsEmail, Courier::Models::SendToMsTeamsChannelID, Courier::Models::SendToMsTeamsConversationID, Courier::Models::SendToMsTeamsChannelName)]
    end
  end
end
