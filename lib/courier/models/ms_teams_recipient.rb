# frozen_string_literal: true

module Courier
  module Models
    class MsTeamsRecipient < Courier::Internal::Type::BaseModel
      # @!attribute ms_teams
      #   Provide at least one of `tenant_id` or `service_url`. If you provide both, they
      #   must agree.
      #
      #   @return [Courier::Models::SendToMsTeamsUserID, Courier::Models::SendToMsTeamsEmail, Courier::Models::SendToMsTeamsChannelID, Courier::Models::SendToMsTeamsConversationID, Courier::Models::SendToMsTeamsChannelName]
      required :ms_teams, union: -> { Courier::MsTeams }

      # @!method initialize(ms_teams:)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::MsTeamsRecipient} for more details.
      #
      #   Send via Microsoft Teams
      #
      #   @param ms_teams [Courier::Models::SendToMsTeamsUserID, Courier::Models::SendToMsTeamsEmail, Courier::Models::SendToMsTeamsChannelID, Courier::Models::SendToMsTeamsConversationID, Courier::Models::SendToMsTeamsChannelName] Provide at least one of `tenant_id` or `service_url`. If you provide both, they
    end
  end
end
