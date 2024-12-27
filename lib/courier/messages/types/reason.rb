# frozen_string_literal: true

module Courier
  class Messages
    class Reason
      FILTERED = "FILTERED"
      NO_CHANNELS = "NO_CHANNELS"
      NO_PROVIDERS = "NO_PROVIDERS"
      PROVIDER_ERROR = "PROVIDER_ERROR"
      UNPUBLISHED = "UNPUBLISHED"
      UNSUBSCRIBED = "UNSUBSCRIBED"
    end
  end
end
