# typed: strong

module Trycourier
  module Models
    class ElementalActionNodeWithType < Trycourier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(
            Trycourier::ElementalActionNodeWithType,
            Trycourier::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.nilable(Trycourier::ElementalActionNodeWithType::Type::OrSymbol)
        )
      end
      attr_reader :type

      sig do
        params(
          type: Trycourier::ElementalActionNodeWithType::Type::OrSymbol
        ).void
      end
      attr_writer :type

      sig do
        params(
          type: Trycourier::ElementalActionNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Trycourier::ElementalActionNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Trycourier::ElementalActionNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTION =
          T.let(
            :action,
            Trycourier::ElementalActionNodeWithType::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Trycourier::ElementalActionNodeWithType::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
