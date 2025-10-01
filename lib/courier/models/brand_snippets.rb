# frozen_string_literal: true

module Courier
  module Models
    class BrandSnippets < Courier::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Courier::Models::BrandSnippets::Item>]
      required :items, -> { Courier::Internal::Type::ArrayOf[Courier::BrandSnippets::Item] }

      # @!method initialize(items:)
      #   @param items [Array<Courier::Models::BrandSnippets::Item>]

      class Item < Courier::Internal::Type::BaseModel
        # @!attribute format_
        #
        #   @return [Symbol, Courier::Models::BrandSnippets::Item::Format]
        required :format_, enum: -> { Courier::BrandSnippets::Item::Format }, api_name: :format

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute value
        #
        #   @return [String]
        required :value, String

        # @!method initialize(format_:, name:, value:)
        #   @param format_ [Symbol, Courier::Models::BrandSnippets::Item::Format]
        #   @param name [String]
        #   @param value [String]

        # @see Courier::Models::BrandSnippets::Item#format_
        module Format
          extend Courier::Internal::Type::Enum

          HANDLEBARS = :handlebars

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
