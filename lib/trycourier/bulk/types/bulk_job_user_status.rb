# frozen_string_literal: true

module Courier
  class Bulk
    # @type [BULK_JOB_USER_STATUS]
    BULK_JOB_USER_STATUS = { pending: "PENDING", enqueued: "ENQUEUED", error: "ERROR" }.freeze
  end
end
