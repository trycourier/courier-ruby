# frozen_string_literal: true

module Courier
  class Messages
    # @type [REASON]
    REASON = {
      filtered: "FILTERED",
      no_channels: "NO_CHANNELS",
      no_providers: "NO_PROVIDERS",
      provider_error: "PROVIDER_ERROR",
      unpublished: "UNPUBLISHED",
      unsubscribed: "UNSUBSCRIBED"
    }.freeze
  end
end
