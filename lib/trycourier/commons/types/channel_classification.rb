# frozen_string_literal: true

module Courier
  class Commons
    # @type [CHANNEL_CLASSIFICATION]
    CHANNEL_CLASSIFICATION = {
      direct_message: "direct_message",
      email: "email",
      push: "push",
      sms: "sms",
      webhook: "webhook",
      inbox: "inbox"
    }.freeze
  end
end
