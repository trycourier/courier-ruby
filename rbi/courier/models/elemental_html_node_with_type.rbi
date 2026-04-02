# typed: strong

module Courier
  module Models
    class ElementalHTMLNodeWithType < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalHTMLNodeWithType, Courier::Internal::AnyHash)
        end

      sig do
        returns(T.nilable(Courier::ElementalHTMLNodeWithType::Type::OrSymbol))
      end
      attr_reader :type

      sig do
        params(type: Courier::ElementalHTMLNodeWithType::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          type: Courier::ElementalHTMLNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Courier::ElementalHTMLNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::ElementalHTMLNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HTML =
          T.let(:html, Courier::ElementalHTMLNodeWithType::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ElementalHTMLNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
