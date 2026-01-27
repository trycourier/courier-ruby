# frozen_string_literal: true

module Courier
  module Models
    class MsTeamsRecipient < Courier::Internal::Type::BaseModel
      # @!attribute ms_teams
      #
      #   @return [Courier::Models::SendToMsTeamsUserID, Courier::Models::SendToMsTeamsEmail, Courier::Models::SendToMsTeamsChannelID, Courier::Models::SendToMsTeamsConversationID, Courier::Models::SendToMsTeamsChannelName]
      required :ms_teams, union: -> { Courier::MsTeams }

      # @!method initialize(ms_teams:)
      #   Send via Microsoft Teams
      #
      #   @param ms_teams [Courier::Models::SendToMsTeamsUserID, Courier::Models::SendToMsTeamsEmail, Courier::Models::SendToMsTeamsChannelID, Courier::Models::SendToMsTeamsConversationID, Courier::Models::SendToMsTeamsChannelName]
    end
  end
end
