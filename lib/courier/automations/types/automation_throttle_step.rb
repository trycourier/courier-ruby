# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationThrottleStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :max_allowed, -> { Integer }, optional: false, nullable: false
        field :period, -> { String }, optional: false, nullable: false
        field :scope, -> { Courier::Automations::Types::AutomationThrottleScope }, optional: false, nullable: false
        field :throttle_key, -> { String }, optional: true, nullable: false
        field :should_alert, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :on_throttle, lambda {
          Courier::Automations::Types::AutomationThrottleOnThrottle
        }, optional: false, nullable: false
      end
    end
  end
end
