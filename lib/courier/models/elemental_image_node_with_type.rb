# frozen_string_literal: true

module Courier
  module Models
    class ElementalImageNodeWithType < Courier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::ElementalImageNodeWithType::Type, nil]
      optional :type, enum: -> { Courier::ElementalImageNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Courier::Models::ElementalImageNodeWithType::Type]

      module Type
        extend Courier::Internal::Type::Enum

        IMAGE = :image

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
