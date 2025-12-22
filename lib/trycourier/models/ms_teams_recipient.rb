# frozen_string_literal: true

module Trycourier
  module Models
    class MsTeamsRecipient < Trycourier::Internal::Type::BaseModel
      # @!attribute ms_teams
      #
      #   @return [Trycourier::Models::SendToMsTeamsUserID, Trycourier::Models::SendToMsTeamsEmail, Trycourier::Models::SendToMsTeamsChannelID, Trycourier::Models::SendToMsTeamsConversationID, Trycourier::Models::SendToMsTeamsChannelName]
      required :ms_teams, union: -> { Trycourier::MsTeams }

      # @!method initialize(ms_teams:)
      #   Send via Microsoft Teams
      #
      #   @param ms_teams [Trycourier::Models::SendToMsTeamsUserID, Trycourier::Models::SendToMsTeamsEmail, Trycourier::Models::SendToMsTeamsChannelID, Trycourier::Models::SendToMsTeamsConversationID, Trycourier::Models::SendToMsTeamsChannelName]
    end
  end
end
