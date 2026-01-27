# frozen_string_literal: true

module Courier
  module Models
    class ElementalMetaNodeWithType < Courier::Models::ElementalBaseNode
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::ElementalMetaNodeWithType::Type, nil]
      optional :type, enum: -> { Courier::ElementalMetaNodeWithType::Type }

      # @!method initialize(type: nil)
      #   @param type [Symbol, Courier::Models::ElementalMetaNodeWithType::Type]

      module Type
        extend Courier::Internal::Type::Enum

        META = :meta

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
