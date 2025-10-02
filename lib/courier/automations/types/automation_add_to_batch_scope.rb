# frozen_string_literal: true

module Courier
  module Automations
    module Types
      module AutomationAddToBatchScope
        extend Courier::Internal::Types::Enum

        USER = "user"
        GLOBAL = "global"
        DYNAMIC = "dynamic"
      end
    end
  end
end
