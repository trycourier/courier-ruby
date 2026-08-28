# frozen_string_literal: true

module Courier
  module Models
    class ElementalChannelNode < Courier::Models::ElementalBaseNode
      # @!attribute channel
      #   The channel the contents of this element should be applied to. Can be `email`,
      #   `push`, `direct_message`, `sms` or a provider such as slack
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute font_size
      #   Email only. Document-level base font size (CSS px, e.g. `16px`) for body content
      #   — text, quote, list and action button labels. Heading styles (`h1`/`h2`/`h3`)
      #   and `subtext` keep their preset sizes.
      #
      #   @return [String, nil]
      optional :font_size, String, nil?: true

      # @!attribute line_height
      #   Email only. Document-level line height (CSS px or unitless multiplier, e.g.
      #   `24px` or `1.5`) applied to all body content unless overridden per block.
      #
      #   @return [String, nil]
      optional :line_height, String, nil?: true

      # @!attribute padding
      #   Email only. Document-level body padding applied once around the email body, as a
      #   CSS px shorthand (1–4 values), e.g. `48px 64px`.
      #
      #   @return [String, nil]
      optional :padding, String, nil?: true

      # @!attribute raw
      #   Raw data to apply to the channel. If `elements` has not been specified, `raw` is
      #   required.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :raw, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown], nil?: true

      # @!method initialize(channel: nil, font_size: nil, line_height: nil, padding: nil, raw: nil)
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
      #   @param channel [String] The channel the contents of this element should be applied to. Can be `email`, `
      #
      #   @param font_size [String, nil] Email only. Document-level base font size (CSS px, e.g. `16px`) for body content
      #
      #   @param line_height [String, nil] Email only. Document-level line height (CSS px or unitless multiplier, e.g. `24p
      #
      #   @param padding [String, nil] Email only. Document-level body padding applied once around the email body, as a
      #
      #   @param raw [Hash{Symbol=>Object}, nil] Raw data to apply to the channel. If `elements` has not been specified, `raw` is
    end
  end
end
