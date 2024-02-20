# frozen_string_literal: true

module Courier
  class Messages
    # @type [MESSAGE_STATUS]
    MESSAGE_STATUS = {
      clicked: "CLICKED",
      delivered: "DELIVERED",
      enqueued: "ENQUEUED",
      opened: "OPENED",
      canceled: "CANCELED",
      sent: "SENT",
      undeliverable: "UNDELIVERABLE",
      unmapped: "UNMAPPED",
      unroutable: "UNROUTABLE"
    }.freeze
  end
end
