# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationThrottleOnThrottle < Internal::Types::Model
        field :node_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
