# frozen_string_literal: true

module Trycourier
  module Models
    class SlackRecipient < Trycourier::Internal::Type::BaseModel
      # @!attribute slack
      #
      #   @return [Trycourier::Models::SendToSlackChannel, Trycourier::Models::SendToSlackEmail, Trycourier::Models::SendToSlackUserID]
      required :slack, union: -> { Trycourier::Slack }

      # @!method initialize(slack:)
      #   Send via Slack (channel, email, or user_id)
      #
      #   @param slack [Trycourier::Models::SendToSlackChannel, Trycourier::Models::SendToSlackEmail, Trycourier::Models::SendToSlackUserID]
    end
  end
end
