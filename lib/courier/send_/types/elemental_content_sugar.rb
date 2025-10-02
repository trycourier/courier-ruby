# frozen_string_literal: true

module Courier
  module Send
    module Types
      # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
      class ElementalContentSugar < Internal::Types::Model
        field :title, -> { String }, optional: false, nullable: false
        field :body, -> { String }, optional: false, nullable: false
      end
    end
  end
end
