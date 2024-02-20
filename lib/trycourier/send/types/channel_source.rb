# frozen_string_literal: true

module Courier
  class Send
    # @type [CHANNEL_SOURCE]
    CHANNEL_SOURCE = { subscription: "subscription", list: "list", recipient: "recipient" }.freeze
  end
end
