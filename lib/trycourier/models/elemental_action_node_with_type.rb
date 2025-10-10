# frozen_string_literal: true

module Trycourier
  module Models
    class ElementalActionNodeWithType < Trycourier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::ElementalActionNodeWithType::Type, nil]
      optional :type, enum: -> { Trycourier::ElementalActionNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Trycourier::Models::ElementalActionNodeWithType::Type]

      module Type
        extend Trycourier::Internal::Type::Enum

        ACTION = :action

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
