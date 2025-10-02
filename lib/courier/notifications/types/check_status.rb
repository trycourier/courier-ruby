# frozen_string_literal: true

module Courier
  module Notifications
    module Types
      module CheckStatus
        extend Courier::Internal::Types::Enum

        RESOLVED = "RESOLVED"
        FAILED = "FAILED"
        PENDING = "PENDING"
      end
    end
  end
end
