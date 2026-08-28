# frozen_string_literal: true

module Courier
  module Models
    # Represents a body of text to be rendered inside of the notification.
    module ElementalNode
      extend Courier::Internal::Type::Union

      # Represents a body of text to be rendered inside of the notification.
      variant -> { Courier::ElementalTextNodeWithType }

      # The meta element contains information describing the notification that may  be used by a particular channel or provider. One important field is the title  field which will be used as the title for channels that support it.
      variant -> { Courier::ElementalMetaNodeWithType }

      # The channel element allows a notification to be customized based on which channel it is sent through.  For example, you may want to display a detailed message when the notification is sent through email,  and a more concise message in a push notification. Channel elements are only valid as top-level  elements; you cannot nest channel elements. If there is a channel element specified at the top-level  of the document, all sibling elements must be channel elements. Note: As an alternative, most elements support a `channel` property. Which allows you to selectively  display an individual element on a per channel basis. See the  [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/) for more details.
      variant -> { Courier::ElementalChannelNodeWithType }

      # Used to embed an image into the notification.
      variant -> { Courier::ElementalImageNodeWithType }

      # Allows the user to execute an action. Can be a button or a link.
      variant -> { Courier::ElementalActionNodeWithType }

      # Renders a dividing line between elements.
      variant -> { Courier::ElementalDividerNodeWithType }

      # Renders a quote block.
      variant -> { Courier::ElementalQuoteNodeWithType }

      # Raw HTML string inside an Elemental document. When rendering a message, this node is turned into output only for the email channel; for other channels it produces no blocks.
      variant -> { Courier::ElementalHTMLNodeWithType }

      # @!method self.variants
      #   @return [Array(Courier::Models::ElementalTextNodeWithType, Courier::Models::ElementalMetaNodeWithType, Courier::Models::ElementalChannelNodeWithType, Courier::Models::ElementalImageNodeWithType, Courier::Models::ElementalActionNodeWithType, Courier::Models::ElementalDividerNodeWithType, Courier::Models::ElementalQuoteNodeWithType, Courier::Models::ElementalHTMLNodeWithType)]
    end
  end
end
