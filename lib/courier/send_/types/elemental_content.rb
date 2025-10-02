# frozen_string_literal: true

module Courier
  module Send
    module Types
      class ElementalContent < Internal::Types::Model
        field :version, -> { String }, optional: false, nullable: false
        field :brand, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        field :elements, lambda {
          Internal::Types::Array[Courier::Send::Types::ElementalNode]
        }, optional: false, nullable: false
      end
    end
  end
end
