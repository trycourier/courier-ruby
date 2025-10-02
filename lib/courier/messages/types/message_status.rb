# frozen_string_literal: true

module Courier
  module Messages
    module Types
      module MessageStatus
        extend Courier::Internal::Types::Enum

        CANCELED = "CANCELED"
        CLICKED = "CLICKED"
        DELAYED = "DELAYED"
        DELIVERED = "DELIVERED"
        DIGESTED = "DIGESTED"
        ENQUEUED = "ENQUEUED"
        FILTERED = "FILTERED"
        OPENED = "OPENED"
        ROUTED = "ROUTED"
        SENT = "SENT"
        SIMULATED = "SIMULATED"
        THROTTLED = "THROTTLED"
        UNDELIVERABLE = "UNDELIVERABLE"
        UNMAPPED = "UNMAPPED"
        UNROUTABLE = "UNROUTABLE"
      end
    end
  end
end
