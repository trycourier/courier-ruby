# typed: strong

module Trycourier
  module Models
    class ElementalTextNodeWithType < Trycourier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::ElementalTextNodeWithType,
            Trycourier::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(Trycourier::ElementalTextNodeWithType::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(type: Trycourier::ElementalTextNodeWithType::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          type: Trycourier::ElementalTextNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Trycourier::ElementalTextNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::ElementalTextNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT =
          T.let(
            :text,
            Trycourier::ElementalTextNodeWithType::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Trycourier::ElementalTextNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
