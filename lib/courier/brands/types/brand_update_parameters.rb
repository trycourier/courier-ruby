# frozen_string_literal: true

module Courier
  module Brands
    module Types
      class BrandUpdateParameters < Internal::Types::Model
        field :brand_id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :settings, -> { Courier::Brands::Types::BrandSettings }, optional: true, nullable: false
        field :snippets, -> { Courier::Brands::Types::BrandSnippets }, optional: true, nullable: false
      end
    end
  end
end
