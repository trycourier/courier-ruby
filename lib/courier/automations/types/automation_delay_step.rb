# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationDelayStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :duration, -> { String }, optional: true, nullable: false
        field :until_, -> { String }, optional: true, nullable: false
      end
    end
  end
end
