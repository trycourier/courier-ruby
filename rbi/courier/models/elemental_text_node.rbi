# typed: strong

module Courier
  module Models
    class ElementalTextNode < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalTextNode, Courier::Internal::AnyHash)
        end

      # Text alignment.
      sig { returns(T.nilable(Courier::ElementalTextNode::Align::OrSymbol)) }
      attr_reader :align

      sig { params(align: Courier::ElementalTextNode::Align::OrSymbol).void }
      attr_writer :align

      # Apply bold to the text
      sig { returns(T.nilable(String)) }
      attr_accessor :bold

      # Specifies the color of text. Can be any valid css color value
      sig { returns(T.nilable(String)) }
      attr_accessor :color

      # The text content displayed in the notification. Either this field must be
      # specified, or the elements field
      sig { returns(T.nilable(String)) }
      attr_reader :content

      sig { params(content: String).void }
      attr_writer :content

      # CSS px font size for this text block, e.g. `16px`. Overrides the size of the
      # `text_style` preset. Email only.
      sig { returns(T.nilable(String)) }
      attr_accessor :font_size

      sig { returns(T.nilable(Courier::ElementalTextNode::Format::OrSymbol)) }
      attr_accessor :format_

      # Apply italics to the text
      sig { returns(T.nilable(String)) }
      attr_accessor :italic

      # CSS line height for this text block, as a px value or a unitless multiplier,
      # e.g. `24px` or `1.5`. Email only.
      sig { returns(T.nilable(String)) }
      attr_accessor :line_height

      # Region specific content. See
      # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
      # for more details.
      sig { returns(T.nilable(T::Hash[Symbol, Courier::LocaleItem])) }
      attr_accessor :locales

      # Apply a strike through the text
      sig { returns(T.nilable(String)) }
      attr_accessor :strikethrough

      # Allows the text to be rendered as a heading level.
      sig { returns(T.nilable(Courier::TextStyle::OrSymbol)) }
      attr_accessor :text_style

      # Apply an underline to the text
      sig { returns(T.nilable(String)) }
      attr_accessor :underline

      # Represents a body of text to be rendered inside of the notification.
      sig do
        params(
          align: Courier::ElementalTextNode::Align::OrSymbol,
          bold: T.nilable(String),
          color: T.nilable(String),
          content: String,
          font_size: T.nilable(String),
          format_: T.nilable(Courier::ElementalTextNode::Format::OrSymbol),
          italic: T.nilable(String),
          line_height: T.nilable(String),
          locales: T.nilable(T::Hash[Symbol, Courier::LocaleItem::OrHash]),
          strikethrough: T.nilable(String),
          text_style: T.nilable(Courier::TextStyle::OrSymbol),
          underline: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Text alignment.
        align: nil,
        # Apply bold to the text
        bold: nil,
        # Specifies the color of text. Can be any valid css color value
        color: nil,
        # The text content displayed in the notification. Either this field must be
        # specified, or the elements field
        content: nil,
        # CSS px font size for this text block, e.g. `16px`. Overrides the size of the
        # `text_style` preset. Email only.
        font_size: nil,
        format_: nil,
        # Apply italics to the text
        italic: nil,
        # CSS line height for this text block, as a px value or a unitless multiplier,
        # e.g. `24px` or `1.5`. Email only.
        line_height: nil,
        # Region specific content. See
        # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
        # for more details.
        locales: nil,
        # Apply a strike through the text
        strikethrough: nil,
        # Allows the text to be rendered as a heading level.
        text_style: nil,
        # Apply an underline to the text
        underline: nil
      )
      end

      sig do
        override.returns(
          {
            align: Courier::ElementalTextNode::Align::OrSymbol,
            bold: T.nilable(String),
            color: T.nilable(String),
            content: String,
            font_size: T.nilable(String),
            format_: T.nilable(Courier::ElementalTextNode::Format::OrSymbol),
            italic: T.nilable(String),
            line_height: T.nilable(String),
            locales: T.nilable(T::Hash[Symbol, Courier::LocaleItem]),
            strikethrough: T.nilable(String),
            text_style: T.nilable(Courier::TextStyle::OrSymbol),
            underline: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Text alignment.
      module Align
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::ElementalTextNode::Align) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LEFT = T.let(:left, Courier::ElementalTextNode::Align::TaggedSymbol)
        CENTER = T.let(:center, Courier::ElementalTextNode::Align::TaggedSymbol)
        RIGHT = T.let(:right, Courier::ElementalTextNode::Align::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ElementalTextNode::Align::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Format
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::ElementalTextNode::Format) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MARKDOWN =
          T.let(:markdown, Courier::ElementalTextNode::Format::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ElementalTextNode::Format::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
