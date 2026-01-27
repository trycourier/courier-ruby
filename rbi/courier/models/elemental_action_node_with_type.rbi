# typed: strong

module Courier
  module Models
    class ElementalActionNodeWithType < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(
            Courier::ElementalActionNodeWithType,
            Courier::Internal::AnyHash
          )
        end

      sig do
        returns(T.nilable(Courier::ElementalActionNodeWithType::Type::OrSymbol))
      end
      attr_reader :type

      sig do
        params(type: Courier::ElementalActionNodeWithType::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          type: Courier::ElementalActionNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Courier::ElementalActionNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::ElementalActionNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTION =
          T.let(
            :action,
            Courier::ElementalActionNodeWithType::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::ElementalActionNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
