# frozen_string_literal: true

module Courier
  module Automations
    module Types
      module AutomationAddToBatchRetainType
        extend Courier::Internal::Types::Enum

        FIRST = "first"
        LAST = "last"
        HIGHEST = "highest"
        LOWEST = "lowest"
      end
    end
  end
end
