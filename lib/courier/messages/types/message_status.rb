# frozen_string_literal: true

module Courier
  class Messages
    class MessageStatus
      CLICKED = "CLICKED"
      DELIVERED = "DELIVERED"
      ENQUEUED = "ENQUEUED"
      OPENED = "OPENED"
      CANCELED = "CANCELED"
      SENT = "SENT"
      THROTTLED = "THROTTLED"
      UNDELIVERABLE = "UNDELIVERABLE"
      UNMAPPED = "UNMAPPED"
      UNROUTABLE = "UNROUTABLE"
    end
  end
end
