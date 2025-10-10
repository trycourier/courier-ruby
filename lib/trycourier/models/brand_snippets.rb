# frozen_string_literal: true

module Trycourier
  module Models
    class BrandSnippets < Trycourier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Trycourier::Models::BrandSnippet>, nil]
      optional :items, -> { Trycourier::Internal::Type::ArrayOf[Trycourier::BrandSnippet] }, nil?: true

      # @!method initialize(items: nil)
      #   @param items [Array<Trycourier::Models::BrandSnippet>, nil]
    end
  end
end
