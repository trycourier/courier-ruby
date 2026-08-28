# frozen_string_literal: true

module Courier
  module Models
    class ElementalActionNodeWithType < Courier::Models::ElementalActionNode
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::ElementalActionNodeWithType::Type, nil]
      optional :type, enum: -> { Courier::ElementalActionNodeWithType::Type }

      # @!method initialize(type: nil)
      #   Allows the user to execute an action. Can be a button or a link.
      #
      #   @param type [Symbol, Courier::Models::ElementalActionNodeWithType::Type]

      module Type
        extend Courier::Internal::Type::Enum

        ACTION = :action

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
