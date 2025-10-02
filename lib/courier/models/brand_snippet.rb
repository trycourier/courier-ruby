# frozen_string_literal: true

module Courier
  module Models
    class BrandSnippet < Courier::Internal::Type::BaseModel
      # @!attribute format_
      #
      #   @return [Symbol, Courier::Models::BrandSnippet::Format]
      required :format_, enum: -> { Courier::BrandSnippet::Format }, api_name: :format

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute value
      #
      #   @return [String]
      required :value, String

      # @!method initialize(format_:, name:, value:)
      #   @param format_ [Symbol, Courier::Models::BrandSnippet::Format]
      #   @param name [String]
      #   @param value [String]

      # @see Courier::Models::BrandSnippet#format_
      module Format
        extend Courier::Internal::Type::Enum

        HANDLEBARS = :handlebars

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
