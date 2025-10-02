# frozen_string_literal: true

module Courier
  module Send
    module Types
      class ElementalBaseNode < Internal::Types::Model
        field :channels, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :ref, -> { String }, optional: true, nullable: false
        field :if_, -> { String }, optional: true, nullable: false
        field :loop, -> { String }, optional: true, nullable: false
      end
    end
  end
end
