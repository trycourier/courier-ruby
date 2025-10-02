# frozen_string_literal: true

module Courier
  module Brands
    module Types
      class BrandColors < Internal::Types::Model
        field :primary, -> { String }, optional: true, nullable: false
        field :secondary, -> { String }, optional: true, nullable: false
        field :tertiary, -> { String }, optional: true, nullable: false
      end
    end
  end
end
