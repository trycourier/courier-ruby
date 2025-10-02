# frozen_string_literal: true

module Courier
  module Messages
    module Types
      module Reason
        extend Courier::Internal::Types::Enum

        BOUNCED = "BOUNCED"
        FAILED = "FAILED"
        FILTERED = "FILTERED"
        NO_CHANNELS = "NO_CHANNELS"
        NO_PROVIDERS = "NO_PROVIDERS"
        OPT_IN_REQUIRED = "OPT_IN_REQUIRED"
        PROVIDER_ERROR = "PROVIDER_ERROR"
        UNPUBLISHED = "UNPUBLISHED"
        UNSUBSCRIBED = "UNSUBSCRIBED"
      end
    end
  end
end
