# frozen_string_literal: true

module Courier
  module Profiles
    module Types
      class Pagerduty < Internal::Types::Model
        field :routing_key, -> { String }, optional: true, nullable: false
        field :event_action, -> { String }, optional: true, nullable: false
        field :severity, -> { String }, optional: true, nullable: false
        field :source, -> { String }, optional: true, nullable: false
      end
    end
  end
end
