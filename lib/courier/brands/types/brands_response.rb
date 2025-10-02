# frozen_string_literal: true

module Courier
  module Brands
    module Types
      class BrandsResponse < Internal::Types::Model
        field :paging, -> { Courier::Commons::Types::Paging }, optional: false, nullable: false
        field :results, -> { Internal::Types::Array[Courier::Brands::Types::Brand] }, optional: false, nullable: false
      end
    end
  end
end
