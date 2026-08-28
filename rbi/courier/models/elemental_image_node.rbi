# typed: strong

module Courier
  module Models
    class ElementalImageNode < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalImageNode, Courier::Internal::AnyHash)
        end

      # The source of the image.
      sig { returns(String) }
      attr_accessor :src

      # The alignment of the image.
      sig { returns(T.nilable(Courier::Alignment::OrSymbol)) }
      attr_accessor :align

      # Alternate text for the image.
      sig { returns(T.nilable(String)) }
      attr_accessor :alt_text

      # CSS border color applied to the image. For example, `#ccc`
      sig { returns(T.nilable(String)) }
      attr_accessor :border_color

      # CSS border width applied to the image. For example, `1px`
      sig { returns(T.nilable(String)) }
      attr_accessor :border_size

      # A URL to link to when the image is clicked.
      sig { returns(T.nilable(String)) }
      attr_accessor :href

      # CSS padding applied around the image. For example, `10px`
      sig { returns(T.nilable(String)) }
      attr_accessor :padding

      # CSS width properties to apply to the image. For example, 50px
      sig { returns(T.nilable(String)) }
      attr_accessor :width

      # Used to embed an image into the notification.
      sig do
        params(
          src: String,
          align: T.nilable(Courier::Alignment::OrSymbol),
          alt_text: T.nilable(String),
          border_color: T.nilable(String),
          border_size: T.nilable(String),
          href: T.nilable(String),
          padding: T.nilable(String),
          width: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The source of the image.
        src:,
        # The alignment of the image.
        align: nil,
        # Alternate text for the image.
        alt_text: nil,
        # CSS border color applied to the image. For example, `#ccc`
        border_color: nil,
        # CSS border width applied to the image. For example, `1px`
        border_size: nil,
        # A URL to link to when the image is clicked.
        href: nil,
        # CSS padding applied around the image. For example, `10px`
        padding: nil,
        # CSS width properties to apply to the image. For example, 50px
        width: nil
      )
      end

      sig do
        override.returns(
          {
            src: String,
            align: T.nilable(Courier::Alignment::OrSymbol),
            alt_text: T.nilable(String),
            border_color: T.nilable(String),
            border_size: T.nilable(String),
            href: T.nilable(String),
            padding: T.nilable(String),
            width: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
