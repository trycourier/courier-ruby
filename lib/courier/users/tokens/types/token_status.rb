# frozen_string_literal: true

module Courier
  module Users
    module Tokens
      module Types
        module TokenStatus
          extend Courier::Internal::Types::Enum

          ACTIVE = "active"
          UNKNOWN = "unknown"
          FAILED = "failed"
          REVOKED = "revoked"
        end
      end
    end
  end
end
