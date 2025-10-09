# frozen_string_literal: true

module Trycourier
  module Models
    class ElementalImageNodeWithType < Trycourier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::ElementalImageNodeWithType::Type, nil]
      optional :type, enum: -> { Trycourier::ElementalImageNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Trycourier::Models::ElementalImageNodeWithType::Type]

      module Type
        extend Trycourier::Internal::Type::Enum

        IMAGE = :image

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
