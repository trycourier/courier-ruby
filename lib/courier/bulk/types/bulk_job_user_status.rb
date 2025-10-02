# frozen_string_literal: true

module Courier
  module Bulk
    module Types
      module BulkJobUserStatus
        extend Courier::Internal::Types::Enum

        PENDING = "PENDING"
        ENQUEUED = "ENQUEUED"
        ERROR = "ERROR"
      end
    end
  end
end
