# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationInvokeParams < Internal::Types::Model
        field :brand, -> { String }, optional: true, nullable: false
        field :data, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :profile, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        field :recipient, -> { String }, optional: true, nullable: false
        field :template, -> { String }, optional: true, nullable: false
      end
    end
  end
end
