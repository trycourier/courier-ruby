# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationCancelStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :cancelation_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
