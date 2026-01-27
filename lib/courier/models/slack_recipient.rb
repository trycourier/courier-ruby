# frozen_string_literal: true

module Courier
  module Models
    class SlackRecipient < Courier::Internal::Type::BaseModel
      # @!attribute slack
      #
      #   @return [Courier::Models::SendToSlackChannel, Courier::Models::SendToSlackEmail, Courier::Models::SendToSlackUserID]
      required :slack, union: -> { Courier::Slack }

      # @!method initialize(slack:)
      #   Send via Slack (channel, email, or user_id)
      #
      #   @param slack [Courier::Models::SendToSlackChannel, Courier::Models::SendToSlackEmail, Courier::Models::SendToSlackUserID]
    end
  end
end
