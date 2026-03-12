# frozen_string_literal: true

module Courier
  module Models
    class ElementalContent < Courier::Internal::Type::BaseModel
      # @!attribute elements
      #
      #   @return [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType>]
      required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::ElementalNode] }

      # @!attribute version
      #   For example, "2022-01-01"
      #
      #   @return [String]
      required :version, String

      # @!method initialize(elements:, version:)
      #   @param elements [Array<Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType>]
      #
      #   @param version [String] For example, "2022-01-01"
    end
  end
end
