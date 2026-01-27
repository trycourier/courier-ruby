# typed: strong

module Courier
  module Models
    class ElementalImageNodeWithType < Courier::Models::ElementalBaseNode
      OrHash =
        T.type_alias do
          T.any(Courier::ElementalImageNodeWithType, Courier::Internal::AnyHash)
        end

      sig do
        returns(T.nilable(Courier::ElementalImageNodeWithType::Type::OrSymbol))
      end
      attr_reader :type

      sig do
        params(type: Courier::ElementalImageNodeWithType::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          type: Courier::ElementalImageNodeWithType::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(type: nil)
      end

      sig do
        override.returns(
          { type: Courier::ElementalImageNodeWithType::Type::OrSymbol }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::ElementalImageNodeWithType::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IMAGE =
          T.let(:image, Courier::ElementalImageNodeWithType::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::ElementalImageNodeWithType::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
