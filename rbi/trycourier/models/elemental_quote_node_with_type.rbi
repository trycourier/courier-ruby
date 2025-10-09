# typed: strong

module Trycourier
  module Models
    class ElementalQuoteNodeWithType < Trycourier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::ElementalQuoteNodeWithType,
            Trycourier::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(Trycourier::ElementalQuoteNodeWithType::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(
          type: Trycourier::ElementalQuoteNodeWithType::Type::OrSymbol
        ).void
      end
      attr_writer :type

      sig do
        params(
          type: Trycourier::ElementalQuoteNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Trycourier::ElementalQuoteNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::ElementalQuoteNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUOTE =
          T.let(
            :quote,
            Trycourier::ElementalQuoteNodeWithType::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Trycourier::ElementalQuoteNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
