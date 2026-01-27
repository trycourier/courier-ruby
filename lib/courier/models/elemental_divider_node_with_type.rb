# frozen_string_literal: true

module Courier
  module Models
    class ElementalDividerNodeWithType < Courier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::ElementalDividerNodeWithType::Type, nil]
      optional :type, enum: -> { Courier::ElementalDividerNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Courier::Models::ElementalDividerNodeWithType::Type]

      module Type
        extend Courier::Internal::Type::Enum

        DIVIDER = :divider

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
