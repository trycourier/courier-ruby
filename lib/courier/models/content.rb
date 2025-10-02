# frozen_string_literal: true

module Courier
  module Models
    # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
    module Content
      extend Courier::Internal::Type::Union

      variant -> { Courier::Content::ElementalContent }

      # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
      variant -> { Courier::Content::ElementalContentSugar }

      class ElementalContent < Courier::Internal::Type::BaseModel
        # @!attribute elements
        #
        #   @return [Array<Courier::Models::ElementalNode::UnionMember0, Courier::Models::ElementalNode::UnionMember1, Courier::Models::ElementalNode::UnionMember2, Courier::Models::ElementalNode::UnionMember3, Courier::Models::ElementalNode::UnionMember4, Courier::Models::ElementalNode::UnionMember5, Courier::Models::ElementalNode::UnionMember6, Courier::Models::ElementalNode::UnionMember7>]
        required :elements, -> { Courier::Internal::Type::ArrayOf[union: Courier::ElementalNode] }

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
        #   @param elements [Array<Courier::Models::ElementalNode::UnionMember0, Courier::Models::ElementalNode::UnionMember1, Courier::Models::ElementalNode::UnionMember2, Courier::Models::ElementalNode::UnionMember3, Courier::Models::ElementalNode::UnionMember4, Courier::Models::ElementalNode::UnionMember5, Courier::Models::ElementalNode::UnionMember6, Courier::Models::ElementalNode::UnionMember7>]
        #
        #   @param version [String] For example, "2022-01-01"
        #
        #   @param brand [Object]
      end

      class ElementalContentSugar < Courier::Internal::Type::BaseModel
        # @!attribute body
        #   The text content displayed in the notification.
        #
        #   @return [String]
        required :body, String

        # @!attribute title
        #   The title to be displayed by supported channels i.e. push, email (as subject)
        #
        #   @return [String]
        required :title, String

        # @!method initialize(body:, title:)
        #   Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
        #
        #   @param body [String] The text content displayed in the notification.
        #
        #   @param title [String] The title to be displayed by supported channels i.e. push, email (as subject)
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::Content::ElementalContent, Courier::Models::Content::ElementalContentSugar)]
    end
  end
end
