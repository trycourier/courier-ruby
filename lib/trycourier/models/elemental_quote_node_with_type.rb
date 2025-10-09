# frozen_string_literal: true

module Trycourier
  module Models
    class ElementalQuoteNodeWithType < Trycourier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::ElementalQuoteNodeWithType::Type, nil]
      optional :type, enum: -> { Trycourier::ElementalQuoteNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Trycourier::Models::ElementalQuoteNodeWithType::Type]

      module Type
        extend Trycourier::Internal::Type::Enum

        QUOTE = :quote

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
