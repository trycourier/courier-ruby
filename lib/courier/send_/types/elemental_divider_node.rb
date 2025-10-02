# frozen_string_literal: true

module Courier
  module Send
    module Types
      # Renders a dividing line between elements.
      class ElementalDividerNode < Internal::Types::Model
        field :color, -> { String }, optional: true, nullable: false
      end
    end
  end
end
