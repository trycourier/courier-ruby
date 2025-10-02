# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationInvokeTemplateParams < Internal::Types::Model
        field :template_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
