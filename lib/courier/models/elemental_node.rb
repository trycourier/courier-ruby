# frozen_string_literal: true

module Courier
  module Models
    # The channel element allows a notification to be customized based on which
    # channel it is sent through. For example, you may want to display a detailed
    # message when the notification is sent through email, and a more concise message
    # in a push notification. Channel elements are only valid as top-level elements;
    # you cannot nest channel elements. If there is a channel element specified at the
    # top-level of the document, all sibling elements must be channel elements. Note:
    # As an alternative, most elements support a `channel` property. Which allows you
    # to selectively display an individual element on a per channel basis. See the
    # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
    # for more details.
    module ElementalNode
      extend Courier::Internal::Type::Union

      variant -> { Courier::ElementalTextNodeWithType }

      variant -> { Courier::ElementalMetaNodeWithType }

      # The channel element allows a notification to be customized based on which channel it is sent through.
      # For example, you may want to display a detailed message when the notification is sent through email,
      # and a more concise message in a push notification. Channel elements are only valid as top-level
      # elements; you cannot nest channel elements. If there is a channel element specified at the top-level
      # of the document, all sibling elements must be channel elements.
      # Note: As an alternative, most elements support a `channel` property. Which allows you to selectively
      # display an individual element on a per channel basis. See the
      # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/) for more details.
      variant -> { Courier::ElementalChannelNodeWithType }

      variant -> { Courier::ElementalImageNodeWithType }

      variant -> { Courier::ElementalActionNodeWithType }

      variant -> { Courier::ElementalDividerNodeWithType }

      variant -> { Courier::ElementalQuoteNodeWithType }

      variant -> { Courier::ElementalNode::UnionMember7 }

      class UnionMember7 < Courier::Models::ElementalBaseNode
        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::ElementalNode::UnionMember7::Type, nil]
        optional :type, enum: -> { Courier::ElementalNode::UnionMember7::Type }

        # @!method initialize(type: nil)
        #   @param type [Symbol, Courier::Models::ElementalNode::UnionMember7::Type]

        module Type
          extend Courier::Internal::Type::Enum

          HTML = :html

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalNode::UnionMember7)]
    end
  end
end
