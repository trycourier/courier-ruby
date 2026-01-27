# frozen_string_literal: true

module Courier
  module Models
    module MsTeams
      extend Courier::Internal::Type::Union

      variant -> { Courier::SendToMsTeamsUserID }

      variant -> { Courier::SendToMsTeamsEmail }

      variant -> { Courier::SendToMsTeamsChannelID }

      variant -> { Courier::SendToMsTeamsConversationID }

      variant -> { Courier::SendToMsTeamsChannelName }

      # @!method self.variants
      #   @return [Array(Courier::Models::SendToMsTeamsUserID, Courier::Models::SendToMsTeamsEmail, Courier::Models::SendToMsTeamsChannelID, Courier::Models::SendToMsTeamsConversationID, Courier::Models::SendToMsTeamsChannelName)]
    end
  end
end
