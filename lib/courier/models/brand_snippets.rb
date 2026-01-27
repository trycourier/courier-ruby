# frozen_string_literal: true

module Courier
  module Models
    class BrandSnippets < Courier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Courier::Models::BrandSnippet>, nil]
      optional :items, -> { Courier::Internal::Type::ArrayOf[Courier::BrandSnippet] }, nil?: true

      # @!method initialize(items: nil)
      #   @param items [Array<Courier::Models::BrandSnippet>, nil]
    end
  end
end
