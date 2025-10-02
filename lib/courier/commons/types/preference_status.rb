# frozen_string_literal: true

module Courier
  module Commons
    module Types
      module PreferenceStatus
        extend Courier::Internal::Types::Enum

        OPTED_IN = "OPTED_IN"
        OPTED_OUT = "OPTED_OUT"
        REQUIRED = "REQUIRED"
      end
    end
  end
end
