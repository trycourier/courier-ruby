# typed: strong

module Trycourier
  module Models
    class ElementalChannelNodeWithType < Trycourier::Models::ElementalChannelNode
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::ElementalChannelNodeWithType,
            Trycourier::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(Trycourier::ElementalChannelNodeWithType::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(
          type: Trycourier::ElementalChannelNodeWithType::Type::OrSymbol
        ).void
      end
      attr_writer :type

      # The channel element allows a notification to be customized based on which
      # channel it is sent through. For example, you may want to display a detailed
      # message when the notification is sent through email, and a more concise message
      # in a push notification. Channel elements are only valid as top-level elements;
      # you cannot nest channel elements. If there is a channel element specified at the
      # top-level of the document, all sibling elements must be channel elements. Note:
      # As an alternative, most elements support a `channel` property. Which allows you
      # to selectively display an individual element on a per channel basis. See the
      # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/)
      # for more details.
      sig do
        params(
          type: Trycourier::ElementalChannelNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Trycourier::ElementalChannelNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::ElementalChannelNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CHANNEL =
          T.let(
            :channel,
            Trycourier::ElementalChannelNodeWithType::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Trycourier::ElementalChannelNodeWithType::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
