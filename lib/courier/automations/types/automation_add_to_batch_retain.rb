# frozen_string_literal: true

module Courier
  module Automations
    module Types
      # Defines what items should be retained and passed along to the next steps when the batch is released
      class AutomationAddToBatchRetain < Internal::Types::Model
        field :type, lambda {
          Courier::Automations::Types::AutomationAddToBatchRetainType
        }, optional: false, nullable: false
        field :count, -> { Integer }, optional: false, nullable: false
        field :sort_key, -> { String }, optional: true, nullable: false
      end
    end
  end
end
