# typed: strong

module Courier
  module Models
    class ElementalDividerNodeWithType < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(
            Courier::ElementalDividerNodeWithType,
            Courier::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(Courier::ElementalDividerNodeWithType::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(type: Courier::ElementalDividerNodeWithType::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          type: Courier::ElementalDividerNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Courier::ElementalDividerNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::ElementalDividerNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DIVIDER =
          T.let(
            :divider,
            Courier::ElementalDividerNodeWithType::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::ElementalDividerNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
