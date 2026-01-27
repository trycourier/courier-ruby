# frozen_string_literal: true

module Courier
  module Models
    class ElementalTextNodeWithType < Courier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::ElementalTextNodeWithType::Type, nil]
      optional :type, enum: -> { Courier::ElementalTextNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Courier::Models::ElementalTextNodeWithType::Type]

      module Type
        extend Courier::Internal::Type::Enum

        TEXT = :text

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
