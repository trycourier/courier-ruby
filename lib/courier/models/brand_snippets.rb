# frozen_string_literal: true

module Courier
  module Models
    class BrandSnippets < Courier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Courier::Models::BrandSnippet>]
      required :items, -> { Courier::Internal::Type::ArrayOf[Courier::BrandSnippet] }

      # @!method initialize(items:)
      #   @param items [Array<Courier::Models::BrandSnippet>]
    end
  end
end
