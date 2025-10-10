# typed: strong

module Trycourier
  module Models
    module Alignment
      extend Trycourier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Trycourier::Alignment) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      CENTER = T.let(:center, Trycourier::Alignment::TaggedSymbol)
      LEFT = T.let(:left, Trycourier::Alignment::TaggedSymbol)
      RIGHT = T.let(:right, Trycourier::Alignment::TaggedSymbol)
      FULL = T.let(:full, Trycourier::Alignment::TaggedSymbol)

      sig { override.returns(T::Array[Trycourier::Alignment::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
