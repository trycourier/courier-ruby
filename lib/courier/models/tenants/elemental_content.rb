# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      class ElementalContent < Courier::Internal::Type::BaseModel
        # @!attribute elements
        #
        #   @return [Array<Courier::Models::ElementalNode::UnionMember0, Courier::Models::ElementalNode::UnionMember1, Courier::Models::ElementalNode::UnionMember2, Courier::Models::ElementalNode::UnionMember3, Courier::Models::ElementalNode::UnionMember4, Courier::Models::ElementalNode::UnionMember5, Courier::Models::ElementalNode::UnionMember6>]
        required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::ElementalNode] }

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
        #   @param elements [Array<Courier::Models::ElementalNode::UnionMember0, Courier::Models::ElementalNode::UnionMember1, Courier::Models::ElementalNode::UnionMember2, Courier::Models::ElementalNode::UnionMember3, Courier::Models::ElementalNode::UnionMember4, Courier::Models::ElementalNode::UnionMember5, Courier::Models::ElementalNode::UnionMember6>]
        #
        #   @param version [String] For example, "2022-01-01"
        #
        #   @param brand [String, nil]
      end
    end
  end
end
