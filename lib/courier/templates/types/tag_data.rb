# frozen_string_literal: true

module Courier
  module Templates
    module Types
      class TagData < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: false, nullable: false
      end
    end
  end
end
