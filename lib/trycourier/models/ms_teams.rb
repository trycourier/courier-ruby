# frozen_string_literal: true

module Trycourier
  module Models
    module MsTeams
      extend Trycourier::Internal::Type::Union

      variant -> { Trycourier::SendToMsTeamsUserID }

      variant -> { Trycourier::SendToMsTeamsEmail }

      variant -> { Trycourier::SendToMsTeamsChannelID }

      variant -> { Trycourier::SendToMsTeamsConversationID }

      variant -> { Trycourier::SendToMsTeamsChannelName }

      # @!method self.variants
      #   @return [Array(Trycourier::Models::SendToMsTeamsUserID, Trycourier::Models::SendToMsTeamsEmail, Trycourier::Models::SendToMsTeamsChannelID, Trycourier::Models::SendToMsTeamsConversationID, Trycourier::Models::SendToMsTeamsChannelName)]
    end
  end
end
