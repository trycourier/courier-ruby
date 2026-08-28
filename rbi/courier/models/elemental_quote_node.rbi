# typed: strong

module Courier
  module Models
    class ElementalQuoteNode < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalQuoteNode, Courier::Internal::AnyHash)
        end

      # The text value of the quote.
      sig { returns(String) }
      attr_accessor :content

      # Alignment of the quote.
      sig { returns(T.nilable(Courier::Alignment::OrSymbol)) }
      attr_accessor :align

      # CSS border color property. For example, `#fff`
      sig { returns(T.nilable(String)) }
      attr_accessor :border_color

      # CSS px font size for this quote block, e.g. `16px`. Overrides the size of the
      # `text_style` preset. Email only.
      sig { returns(T.nilable(String)) }
      attr_accessor :font_size

      # CSS line height for this quote block, as a px value or a unitless multiplier,
      # e.g. `24px` or `1.5`. Email only.
      sig { returns(T.nilable(String)) }
      attr_accessor :line_height

      # Region specific content. See
      # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
      # for more details.
      sig { returns(T.nilable(T::Hash[Symbol, Courier::LocaleItem])) }
      attr_accessor :locales

      sig { returns(T.nilable(Courier::TextStyle::OrSymbol)) }
      attr_reader :text_style

      sig { params(text_style: Courier::TextStyle::OrSymbol).void }
      attr_writer :text_style

      # Renders a quote block.
      sig do
        params(
          content: String,
          align: T.nilable(Courier::Alignment::OrSymbol),
          border_color: T.nilable(String),
          font_size: T.nilable(String),
          line_height: T.nilable(String),
          locales: T.nilable(T::Hash[Symbol, Courier::LocaleItem::OrHash]),
          text_style: Courier::TextStyle::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The text value of the quote.
        content:,
        # Alignment of the quote.
        align: nil,
        # CSS border color property. For example, `#fff`
        border_color: nil,
        # CSS px font size for this quote block, e.g. `16px`. Overrides the size of the
        # `text_style` preset. Email only.
        font_size: nil,
        # CSS line height for this quote block, as a px value or a unitless multiplier,
        # e.g. `24px` or `1.5`. Email only.
        line_height: nil,
        # Region specific content. See
        # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
        # for more details.
        locales: nil,
        text_style: nil
      )
      end

      sig do
        override.returns(
          {
            content: String,
            align: T.nilable(Courier::Alignment::OrSymbol),
            border_color: T.nilable(String),
            font_size: T.nilable(String),
            line_height: T.nilable(String),
            locales: T.nilable(T::Hash[Symbol, Courier::LocaleItem]),
            text_style: Courier::TextStyle::OrSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
