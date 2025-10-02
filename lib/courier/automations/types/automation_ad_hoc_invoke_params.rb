# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationAdHocInvokeParams < Internal::Types::Model
        field :automation, -> { Courier::Automations::Types::Automation }, optional: false, nullable: false
      end
    end
  end
end
