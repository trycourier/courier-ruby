# frozen_string_literal: true

module Trycourier
  module Models
    class ElementalChannelNodeWithType < Trycourier::Models::ElementalChannelNode
      # @!attribute type
      #
      #   @return [Symbol, Trycourier::Models::ElementalChannelNodeWithType::Type, nil]
      optional :type, enum: -> { Trycourier::ElementalChannelNodeWithType::Type }

      # @!method initialize(type: nil)
      #   The channel element allows a notification to be customized based on which
      #   channel it is sent through. For example, you may want to display a detailed
      #   message when the notification is sent through email, and a more concise message
      #   in a push notification. Channel elements are only valid as top-level elements;
      #   you cannot nest channel elements. If there is a channel element specified at the
      #   top-level of the document, all sibling elements must be channel elements. Note:
      #   As an alternative, most elements support a `channel` property. Which allows you
      #   to selectively display an individual element on a per channel basis. See the
      #   [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
      #   for more details.
      #
      #   @param type [Symbol, Trycourier::Models::ElementalChannelNodeWithType::Type]

      module Type
        extend Trycourier::Internal::Type::Enum

        CHANNEL = :channel

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
