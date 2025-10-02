# frozen_string_literal: true

module Courier
  module Brands
    module Types
      class BrandParameters < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :settings, -> { Courier::Brands::Types::BrandSettings }, optional: false, nullable: false
        field :snippets, -> { Courier::Brands::Types::BrandSnippets }, optional: true, nullable: false
      end
    end
  end
end
