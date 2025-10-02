# frozen_string_literal: true

module Courier
  module Brands
    module Types
      class ListBrandsRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
