# frozen_string_literal: true

module Courier
  class Bulk
    # @type [BULK_JOB_STATUS]
    BULK_JOB_STATUS = { created: "CREATED", processing: "PROCESSING", completed: "COMPLETED", error: "ERROR" }.freeze
  end
end
