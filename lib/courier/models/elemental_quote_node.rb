# frozen_string_literal: true

module Courier
  module Models
    class ElementalQuoteNode < Courier::Models::ElementalBaseNode
      # @!attribute content
      #   The text value of the quote.
      #
      #   @return [String]
      required :content, String

      # @!attribute align
      #   Alignment of the quote.
      #
      #   @return [Symbol, Courier::Models::Alignment, nil]
      optional :align, enum: -> { Courier::Alignment }, nil?: true

      # @!attribute border_color
      #   CSS border color property. For example, `#fff`
      #
      #   @return [String, nil]
      optional :border_color, String, api_name: :borderColor, nil?: true

      # @!attribute font_size
      #   CSS px font size for this quote block, e.g. `16px`. Overrides the size of the
      #   `text_style` preset. Email only.
      #
      #   @return [String, nil]
      optional :font_size, String, nil?: true

      # @!attribute line_height
      #   CSS line height for this quote block, as a px value or a unitless multiplier,
      #   e.g. `24px` or `1.5`. Email only.
      #
      #   @return [String, nil]
      optional :line_height, String, nil?: true

      # @!attribute locales
      #   Region specific content. See
      #   [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
      #   for more details.
      #
      #   @return [Hash{Symbol=>Courier::Models::LocaleItem}, nil]
      optional :locales, -> { Courier::Internal::Type::HashOf[Courier::LocaleItem] }, nil?: true

      # @!attribute text_style
      #
      #   @return [Symbol, Courier::Models::TextStyle, nil]
      optional :text_style, enum: -> { Courier::TextStyle }

      # @!method initialize(content:, align: nil, border_color: nil, font_size: nil, line_height: nil, locales: nil, text_style: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ElementalQuoteNode} for more details.
      #
      #   Renders a quote block.
      #
      #   @param content [String] The text value of the quote.
      #
      #   @param align [Symbol, Courier::Models::Alignment, nil] Alignment of the quote.
      #
      #   @param border_color [String, nil] CSS border color property. For example, `#fff`
      #
      #   @param font_size [String, nil] CSS px font size for this quote block, e.g. `16px`. Overrides the size of the `t
      #
      #   @param line_height [String, nil] CSS line height for this quote block, as a px value or a unitless multiplier, e.
      #
      #   @param locales [Hash{Symbol=>Courier::Models::LocaleItem}, nil] Region specific content. See [locales docs](https://www.courier.com/docs/platfor
      #
      #   @param text_style [Symbol, Courier::Models::TextStyle]
    end
  end
end
