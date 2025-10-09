# frozen_string_literal: true

module Trycourier
  module Models
    class ElementalContent < Trycourier::Internal::Type::BaseModel
      # @!attribute elements
      #
      #   @return [Array<Trycourier::Models::ElementalTextNodeWithType, Trycourier::Models::ElementalMetaNodeWithType, Trycourier::Models::ElementalChannelNodeWithType, Trycourier::Models::ElementalImageNodeWithType, Trycourier::Models::ElementalActionNodeWithType, Trycourier::Models::ElementalDividerNodeWithType, Trycourier::Models::ElementalQuoteNodeWithType>]
      required :elements, -> { Trycourier::Internal::Type::ArrayOf[union: Trycourier::ElementalNode] }

      # @!attribute version
      #   For example, "2022-01-01"
      #
      #   @return [String]
      required :version, String

      # @!attribute brand
      #
      #   @return [String, nil]
      optional :brand, String, nil?: true

      # @!method initialize(elements:, version:, brand: nil)
      #   @param elements [Array<Trycourier::Models::ElementalTextNodeWithType, Trycourier::Models::ElementalMetaNodeWithType, Trycourier::Models::ElementalChannelNodeWithType, Trycourier::Models::ElementalImageNodeWithType, Trycourier::Models::ElementalActionNodeWithType, Trycourier::Models::ElementalDividerNodeWithType, Trycourier::Models::ElementalQuoteNodeWithType>]
      #
      #   @param version [String] For example, "2022-01-01"
      #
      #   @param brand [String, nil]
    end
  end
end
