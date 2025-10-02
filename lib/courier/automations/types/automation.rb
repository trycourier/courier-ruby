# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class Automation < Internal::Types::Model
        field :cancelation_token, -> { String }, optional: true, nullable: false
        field :steps, lambda {
          Internal::Types::Array[Courier::Automations::Types::AutomationStepOption]
        }, optional: false, nullable: false
      end
    end
  end
end
