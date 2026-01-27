# typed: strong

module Courier
  module Models
    class ElementalQuoteNodeWithType < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalQuoteNodeWithType, Courier::Internal::AnyHash)
        end

      sig do
        returns(T.nilable(Courier::ElementalQuoteNodeWithType::Type::OrSymbol))
      end
      attr_reader :type

      sig do
        params(type: Courier::ElementalQuoteNodeWithType::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          type: Courier::ElementalQuoteNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Courier::ElementalQuoteNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::ElementalQuoteNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUOTE =
          T.let(:quote, Courier::ElementalQuoteNodeWithType::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ElementalQuoteNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
