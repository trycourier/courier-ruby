# frozen_string_literal: true

module Trycourier
  module Models
    class ElementalMetaNodeWithType < Trycourier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::ElementalMetaNodeWithType::Type, nil]
      optional :type, enum: -> { Trycourier::ElementalMetaNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Trycourier::Models::ElementalMetaNodeWithType::Type]

      module Type
        extend Trycourier::Internal::Type::Enum

        META = :meta

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
