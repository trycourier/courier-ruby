# typed: strong

module Trycourier
  module Models
    class ElementalMetaNodeWithType < Trycourier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::ElementalMetaNodeWithType,
            Trycourier::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(Trycourier::ElementalMetaNodeWithType::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(type: Trycourier::ElementalMetaNodeWithType::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          type: Trycourier::ElementalMetaNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Trycourier::ElementalMetaNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::ElementalMetaNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        META =
          T.let(
            :meta,
            Trycourier::ElementalMetaNodeWithType::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Trycourier::ElementalMetaNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
