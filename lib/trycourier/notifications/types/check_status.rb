# frozen_string_literal: true

module Courier
  class Notifications
    # @type [CHECK_STATUS]
    CHECK_STATUS = { resolved: "RESOLVED", failed: "FAILED", pending: "PENDING" }.freeze
  end
end
