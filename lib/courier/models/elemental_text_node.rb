# frozen_string_literal: true

module Courier
  module Models
    class ElementalTextNode < Courier::Models::ElementalBaseNode
      # @!attribute content
      #   The text content displayed in the notification. Either this field must be
      #   specified, or the elements field
      #
      #   @return [String]
      required :content, String

      # @!attribute align
      #   Text alignment.
      #
      #   @return [Symbol, Courier::Models::ElementalTextNode::Align, nil]
      optional :align, enum: -> { Courier::ElementalTextNode::Align }

      # @!attribute bold
      #   Apply bold to the text
      #
      #   @return [String, nil]
      optional :bold, String, nil?: true

      # @!attribute color
      #   Specifies the color of text. Can be any valid css color value
      #
      #   @return [String, nil]
      optional :color, String, nil?: true

      # @!attribute font_size
      #   CSS px font size for this text block, e.g. `16px`. Overrides the size of the
      #   `text_style` preset. Email only.
      #
      #   @return [String, nil]
      optional :font_size, String, nil?: true

      # @!attribute format_
      #
      #   @return [Symbol, Courier::Models::ElementalTextNode::Format, nil]
      optional :format_, enum: -> { Courier::ElementalTextNode::Format }, api_name: :format, nil?: true

      # @!attribute italic
      #   Apply italics to the text
      #
      #   @return [String, nil]
      optional :italic, String, nil?: true

      # @!attribute line_height
      #   CSS line height for this text block, as a px value or a unitless multiplier,
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

      # @!attribute strikethrough
      #   Apply a strike through the text
      #
      #   @return [String, nil]
      optional :strikethrough, String, nil?: true

      # @!attribute text_style
      #   Allows the text to be rendered as a heading level.
      #
      #   @return [Symbol, Courier::Models::TextStyle, nil]
      optional :text_style, enum: -> { Courier::TextStyle }, nil?: true

      # @!attribute underline
      #   Apply an underline to the text
      #
      #   @return [String, nil]
      optional :underline, String, nil?: true

      # @!method initialize(content:, align: nil, bold: nil, color: nil, font_size: nil, format_: nil, italic: nil, line_height: nil, locales: nil, strikethrough: nil, text_style: nil, underline: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ElementalTextNode} for more details.
      #
      #   Represents a body of text to be rendered inside of the notification.
      #
      #   @param content [String] The text content displayed in the notification. Either this
      #
      #   @param align [Symbol, Courier::Models::ElementalTextNode::Align] Text alignment.
      #
      #   @param bold [String, nil] Apply bold to the text
      #
      #   @param color [String, nil] Specifies the color of text. Can be any valid css color value
      #
      #   @param font_size [String, nil] CSS px font size for this text block, e.g. `16px`. Overrides the size of the `te
      #
      #   @param format_ [Symbol, Courier::Models::ElementalTextNode::Format, nil]
      #
      #   @param italic [String, nil] Apply italics to the text
      #
      #   @param line_height [String, nil] CSS line height for this text block, as a px value or a unitless multiplier, e.g
      #
      #   @param locales [Hash{Symbol=>Courier::Models::LocaleItem}, nil] Region specific content. See [locales docs](https://www.courier.com/docs/platfor
      #
      #   @param strikethrough [String, nil] Apply a strike through the text
      #
      #   @param text_style [Symbol, Courier::Models::TextStyle, nil] Allows the text to be rendered as a heading level.
      #
      #   @param underline [String, nil] Apply an underline to the text

      # Text alignment.
      module Align
        extend Courier::Internal::Type::Enum

        LEFT = :left
        CENTER = :center
        RIGHT = :right

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module Format
        extend Courier::Internal::Type::Enum

        MARKDOWN = :markdown

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
