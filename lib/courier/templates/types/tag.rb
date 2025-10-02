# frozen_string_literal: true

module Courier
  module Templates
    module Types
      class Tag < Internal::Types::Model
        field :data, -> { Internal::Types::Array[Courier::Templates::Types::TagData] }, optional: false, nullable: false
      end
    end
  end
end
