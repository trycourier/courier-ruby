# frozen_string_literal: true

module Courier
  module Models
    class ElementalQuoteNodeWithType < Courier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::ElementalQuoteNodeWithType::Type, nil]
      optional :type, enum: -> { Courier::ElementalQuoteNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Courier::Models::ElementalQuoteNodeWithType::Type]

      module Type
        extend Courier::Internal::Type::Enum

        QUOTE = :quote

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
