# frozen_string_literal: true

module Courier
  module Send
    module Types
      class TrackingOverride < Internal::Types::Model
        field :open, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
