# frozen_string_literal: true

module Courier
  class Send
    # @type [OVERRIDE]
    OVERRIDE = {
      message_channel_email_override: "MessageChannelEmailOverride",
      message_channel_push_override: "MessageChannelPushOverride"
    }.freeze
  end
end
