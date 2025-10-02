# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationStep < Internal::Types::Model
        field :if_, -> { String }, optional: true, nullable: false
        field :ref, -> { String }, optional: true, nullable: false
      end
    end
  end
end
