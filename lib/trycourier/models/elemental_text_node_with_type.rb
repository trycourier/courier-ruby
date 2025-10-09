# frozen_string_literal: true

module Trycourier
  module Models
    class ElementalTextNodeWithType < Trycourier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::ElementalTextNodeWithType::Type, nil]
      optional :type, enum: -> { Trycourier::ElementalTextNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Trycourier::Models::ElementalTextNodeWithType::Type]

      module Type
        extend Trycourier::Internal::Type::Enum

        TEXT = :text

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
