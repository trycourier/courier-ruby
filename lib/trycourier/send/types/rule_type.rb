# frozen_string_literal: true

module Courier
  class Send
    # @type [RULE_TYPE]
    RULE_TYPE = { snooze: "snooze", channel_preferences: "channel_preferences", status: "status" }.freeze
  end
end
