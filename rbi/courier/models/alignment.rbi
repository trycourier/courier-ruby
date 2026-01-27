# typed: strong

module Courier
  module Models
    module Alignment
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::Alignment) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      CENTER = T.let(:center, Courier::Alignment::TaggedSymbol)
      LEFT = T.let(:left, Courier::Alignment::TaggedSymbol)
      RIGHT = T.let(:right, Courier::Alignment::TaggedSymbol)
      FULL = T.let(:full, Courier::Alignment::TaggedSymbol)

      sig { override.returns(T::Array[Courier::Alignment::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
