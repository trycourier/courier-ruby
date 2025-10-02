# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationInvokeResponse < Internal::Types::Model
        field :run_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
