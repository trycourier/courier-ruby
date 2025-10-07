# frozen_string_literal: true

module Courier
  module Models
    class BrandSnippets < Courier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Courier::Models::BrandSnippets::Item>, nil]
      optional :items, -> { Courier::Internal::Type::ArrayOf[Courier::BrandSnippets::Item] }, nil?: true

      # @!method initialize(items: nil)
      #   @param items [Array<Courier::Models::BrandSnippets::Item>, nil]

      class Item < Courier::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute value
        #
        #   @return [String]
        required :value, String

        # @!method initialize(name:, value:)
        #   @param name [String]
        #   @param value [String]
      end
    end
  end
end
