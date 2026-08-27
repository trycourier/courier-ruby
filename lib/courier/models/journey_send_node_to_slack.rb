# frozen_string_literal: true

module Courier
  module Models
    # Send to a Slack address directly, bypassing the recipient's stored profile.
    # Requires exactly one of `channel`, `user_id`, or `email`.
    module JourneySendNodeToSlack
      extend Courier::Internal::Type::Union

      variant -> { Courier::JourneySendNodeToSlackChannel }

      variant -> { Courier::JourneySendNodeToSlackUserID }

      variant -> { Courier::JourneySendNodeToSlackEmail }

      # @!method self.variants
      #   @return [Array(Courier::Models::JourneySendNodeToSlackChannel, Courier::Models::JourneySendNodeToSlackUserID, Courier::Models::JourneySendNodeToSlackEmail)]
    end
  end
end
