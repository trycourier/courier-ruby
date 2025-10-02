# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationInvokeStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :template, -> { String }, optional: false, nullable: false
      end
    end
  end
end
