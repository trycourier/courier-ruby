# frozen_string_literal: true

module Courier
  module Models
    class ElementalHTMLNodeWithType < Courier::Models::ElementalHTMLNode
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::ElementalHTMLNodeWithType::Type, nil]
      optional :type, enum: -> { Courier::ElementalHTMLNodeWithType::Type }

      # @!method initialize(type: nil)
      #   Raw HTML string inside an Elemental document. When rendering a message, this
      #   node is turned into output only for the email channel; for other channels it
      #   produces no blocks.
      #
      #   @param type [Symbol, Courier::Models::ElementalHTMLNodeWithType::Type]

      module Type
        extend Courier::Internal::Type::Enum

        HTML = :html

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
