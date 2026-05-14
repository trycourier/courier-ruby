# typed: strong

module Courier
  module Models
    class JourneyExitNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyExitNode, Courier::Internal::AnyHash)
        end

      sig { returns(Courier::JourneyExitNode::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      sig do
        params(
          type: Courier::JourneyExitNode::Type::OrSymbol,
          id: String
        ).returns(T.attached_class)
      end
      def self.new(type:, id: nil)
      end

      sig do
        override.returns(
          { type: Courier::JourneyExitNode::Type::OrSymbol, id: String }
        )
      end
      def to_hash
      end

      module Type
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::JourneyExitNode::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXIT = T.let(:exit, Courier::JourneyExitNode::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::JourneyExitNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
