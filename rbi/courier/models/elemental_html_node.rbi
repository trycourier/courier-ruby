# typed: strong

module Courier
  module Models
    class ElementalHTMLNode < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalHTMLNode, Courier::Internal::AnyHash)
        end

      # Raw HTML string to render inside the notification.
      sig { returns(String) }
      attr_accessor :content

      # Region specific content. See
      # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
      # for more details.
      sig { returns(T.nilable(T::Hash[Symbol, Courier::LocaleItem])) }
      attr_accessor :locales

      # Raw HTML string inside an Elemental document. When rendering a message, this
      # node is turned into output only for the email channel; for other channels it
      # produces no blocks.
      sig do
        params(
          content: String,
          locales: T.nilable(T::Hash[Symbol, Courier::LocaleItem::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(
        # Raw HTML string to render inside the notification.
        content:,
        # Region specific content. See
        # [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/)
        # for more details.
        locales: nil
      )
      end

      sig do
        override.returns(
          {
            content: String,
            locales: T.nilable(T::Hash[Symbol, Courier::LocaleItem])
          }
        )
      end
      def to_hash
      end
    end
  end
end
