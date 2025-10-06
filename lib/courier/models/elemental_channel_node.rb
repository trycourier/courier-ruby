# frozen_string_literal: true

module Courier
  module Models
    class ElementalChannelNode < Courier::Models::ElementalBaseNode
      # @!attribute channel
      #   The channel the contents of this element should be applied to. Can be `email`,
      #   `push`, `direct_message`, `sms` or a provider such as slack
      #
      #   @return [String]
      required :channel, String

      # @!attribute raw
      #   Raw data to apply to the channel. If `elements` has not been specified, `raw` is
      #   `required`.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :raw, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!method initialize(channel:, raw: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ElementalChannelNode} for more details.
      #
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
      #   @param channel [String] The channel the contents of this element should be applied to. Can be `email`,
      #
      #   @param raw [Hash{Symbol=>Object}, nil] Raw data to apply to the channel. If `elements` has not been
    end
  end
end
