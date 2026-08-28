# frozen_string_literal: true

module Courier
  module Models
    class ElementalMetaNodeWithType < Courier::Models::ElementalMetaNode
      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::ElementalMetaNodeWithType::Type, nil]
      optional :type, enum: -> { Courier::ElementalMetaNodeWithType::Type }

      # @!method initialize(type: nil)
      #   The meta element contains information describing the notification that may be
      #   used by a particular channel or provider. One important field is the title field
      #   which will be used as the title for channels that support it.
      #
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
