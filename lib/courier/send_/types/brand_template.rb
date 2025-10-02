# frozen_string_literal: true

module Courier
  module Send
    module Types
      class BrandTemplate < Internal::Types::Model
        field :background_color, -> { String }, optional: true, nullable: false
        field :blocks_background_color, -> { String }, optional: true, nullable: false
        field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
        field :footer, -> { String }, optional: true, nullable: false
        field :head, -> { String }, optional: true, nullable: false
        field :header, -> { String }, optional: true, nullable: false
        field :width, -> { String }, optional: true, nullable: false
      end
    end
  end
end
