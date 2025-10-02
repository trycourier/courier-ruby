# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      module BulkJobStatus
        extend Courier::Internal::Types::Enum

        CREATED = "CREATED"
        PROCESSING = "PROCESSING"
        COMPLETED = "COMPLETED"
        ERROR = "ERROR"
      end
    end
  end
end
