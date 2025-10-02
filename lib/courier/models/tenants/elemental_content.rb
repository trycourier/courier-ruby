# frozen_string_literal: true

module Courier
  module Models
    module Tenants
      class ElementalContent < Courier::Internal::Type::BaseModel
        # @!attribute elements
        #
        #   @return [Array<Courier::Models::Tenants::ElementalNode::UnionMember0, Courier::Models::Tenants::ElementalNode::UnionMember1, Courier::Models::Tenants::ElementalNode::UnionMember2, Courier::Models::Tenants::ElementalNode::UnionMember3, Courier::Models::Tenants::ElementalNode::UnionMember4, Courier::Models::Tenants::ElementalNode::UnionMember5, Courier::Models::Tenants::ElementalNode::UnionMember6, Courier::Models::Tenants::ElementalNode::UnionMember7>]
        required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::Tenants::ElementalNode] }

        # @!attribute version
        #   For example, "2022-01-01"
        #
        #   @return [String]
        required :version, String

        # @!attribute brand
        #
        #   @return [Object, nil]
        optional :brand, Courier::Internal::Type::Unknown

        # @!method initialize(elements:, version:, brand: nil)
        #   @param elements [Array<Courier::Models::Tenants::ElementalNode::UnionMember0, Courier::Models::Tenants::ElementalNode::UnionMember1, Courier::Models::Tenants::ElementalNode::UnionMember2, Courier::Models::Tenants::ElementalNode::UnionMember3, Courier::Models::Tenants::ElementalNode::UnionMember4, Courier::Models::Tenants::ElementalNode::UnionMember5, Courier::Models::Tenants::ElementalNode::UnionMember6, Courier::Models::Tenants::ElementalNode::UnionMember7>]
        #
        #   @param version [String] For example, "2022-01-01"
        #
        #   @param brand [Object]
      end
    end
  end
end
