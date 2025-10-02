# frozen_string_literal: true

module Courier
  module Automations
    module Types
      class AutomationSendStep < Internal::Types::Model
        field :action, -> { String }, optional: false, nullable: false
        field :brand, -> { String }, optional: true, nullable: false
        field :data, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :override, lambda {
          Internal::Types::Hash[String, Internal::Types::Hash[String, Object]]
        }, optional: true, nullable: false
        field :profile, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        field :recipient, -> { String }, optional: true, nullable: false
        field :template, -> { String }, optional: true, nullable: false
      end
    end
  end
end
