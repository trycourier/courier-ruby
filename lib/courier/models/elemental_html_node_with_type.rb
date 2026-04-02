# frozen_string_literal: true

module Courier
  module Models
    class ElementalHTMLNodeWithType < Courier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::ElementalHTMLNodeWithType::Type, nil]
      optional :type, enum: -> { Courier::ElementalHTMLNodeWithType::Type }

      # @!method initialize(type: nil)
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
