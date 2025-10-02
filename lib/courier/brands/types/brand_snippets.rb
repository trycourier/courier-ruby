# frozen_string_literal: true

module Courier
  module Brands
    module Types
      class BrandSnippets < Internal::Types::Model
        field :items, lambda {
          Internal::Types::Array[Courier::Brands::Types::BrandSnippet]
        }, optional: false, nullable: false
      end
    end
  end
end
