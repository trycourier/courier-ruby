# frozen_string_literal: true

module Trycourier
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
      extend Trycourier::Internal::Type::Union

      variant -> { Trycourier::ElementalTextNodeWithType }

      variant -> { Trycourier::ElementalMetaNodeWithType }

      # The channel element allows a notification to be customized based on which channel it is sent through.
      # For example, you may want to display a detailed message when the notification is sent through email,
      # and a more concise message in a push notification. Channel elements are only valid as top-level
      # elements; you cannot nest channel elements. If there is a channel element specified at the top-level
      # of the document, all sibling elements must be channel elements.
      # Note: As an alternative, most elements support a `channel` property. Which allows you to selectively
      # display an individual element on a per channel basis. See the
      # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/) for more details.
      variant -> { Trycourier::ElementalChannelNodeWithType }

      variant -> { Trycourier::ElementalImageNodeWithType }

      variant -> { Trycourier::ElementalActionNodeWithType }

      variant -> { Trycourier::ElementalDividerNodeWithType }

      variant -> { Trycourier::ElementalQuoteNodeWithType }

      # @!method self.variants
      #   @return [Array(Trycourier::Models::ElementalTextNodeWithType, Trycourier::Models::ElementalMetaNodeWithType, Trycourier::Models::ElementalChannelNodeWithType, Trycourier::Models::ElementalImageNodeWithType, Trycourier::Models::ElementalActionNodeWithType, Trycourier::Models::ElementalDividerNodeWithType, Trycourier::Models::ElementalQuoteNodeWithType)]
    end
  end
end
