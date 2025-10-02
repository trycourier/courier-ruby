# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationUpdateProfileStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :recipient_id, -> { String }, optional: false, nullable: false
        field :profile, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
        field :merge, -> { Courier::Automations::Types::MergeAlgorithm }, optional: false, nullable: false
      end
    end
  end
end
