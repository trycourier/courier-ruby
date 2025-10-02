# frozen_string_literal: true

module Courier
  module Brands
    module Types
      class BrandSnippet < Internal::Types::Model
        field :format, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :value, -> { String }, optional: false, nullable: false
      end
    end
  end
end
