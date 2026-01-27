# typed: strong

module Courier
  module Models
    class ElementalMetaNodeWithType < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalMetaNodeWithType, Courier::Internal::AnyHash)
        end

      sig do
        returns(T.nilable(Courier::ElementalMetaNodeWithType::Type::OrSymbol))
      end
      attr_reader :type

      sig do
        params(type: Courier::ElementalMetaNodeWithType::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          type: Courier::ElementalMetaNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Courier::ElementalMetaNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::ElementalMetaNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        META =
          T.let(:meta, Courier::ElementalMetaNodeWithType::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ElementalMetaNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
