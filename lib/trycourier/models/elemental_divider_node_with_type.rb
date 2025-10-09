# frozen_string_literal: true

module Trycourier
  module Models
    class ElementalDividerNodeWithType < Trycourier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::ElementalDividerNodeWithType::Type, nil]
      optional :type, enum: -> { Trycourier::ElementalDividerNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Trycourier::Models::ElementalDividerNodeWithType::Type]

      module Type
        extend Trycourier::Internal::Type::Enum

        DIVIDER = :divider

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
