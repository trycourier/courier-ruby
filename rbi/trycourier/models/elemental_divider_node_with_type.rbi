# typed: strong

module Trycourier
  module Models
    class ElementalDividerNodeWithType < Trycourier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::ElementalDividerNodeWithType,
            Trycourier::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(Trycourier::ElementalDividerNodeWithType::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(
          type: Trycourier::ElementalDividerNodeWithType::Type::OrSymbol
        ).void
      end
      attr_writer :type

      sig do
        params(
          type: Trycourier::ElementalDividerNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Trycourier::ElementalDividerNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::ElementalDividerNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DIVIDER =
          T.let(
            :divider,
            Trycourier::ElementalDividerNodeWithType::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Trycourier::ElementalDividerNodeWithType::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
