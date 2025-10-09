# typed: strong

module Trycourier
  module Models
    class ElementalImageNodeWithType < Trycourier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::ElementalImageNodeWithType,
            Trycourier::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(Trycourier::ElementalImageNodeWithType::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(
          type: Trycourier::ElementalImageNodeWithType::Type::OrSymbol
        ).void
      end
      attr_writer :type

      sig do
        params(
          type: Trycourier::ElementalImageNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Trycourier::ElementalImageNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::ElementalImageNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IMAGE =
          T.let(
            :image,
            Trycourier::ElementalImageNodeWithType::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Trycourier::ElementalImageNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
