# typed: strong

module Courier
  module Models
    class ElementalTextNodeWithType < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalTextNodeWithType, Courier::Internal::AnyHash)
        end

      sig do
        returns(T.nilable(Courier::ElementalTextNodeWithType::Type::OrSymbol))
      end
      attr_reader :type

      sig do
        params(type: Courier::ElementalTextNodeWithType::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          type: Courier::ElementalTextNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Courier::ElementalTextNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::ElementalTextNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT =
          T.let(:text, Courier::ElementalTextNodeWithType::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ElementalTextNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
