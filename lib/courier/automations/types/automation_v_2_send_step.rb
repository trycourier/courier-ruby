# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationV2SendStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :message, -> { Courier::Send::Types::Message }, optional: false, nullable: false
      end
    end
  end
end
