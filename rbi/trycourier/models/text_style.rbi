# typed: strong

module Trycourier
  module Models
    module TextStyle
      extend Trycourier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Trycourier::TextStyle) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      TEXT = T.let(:text, Trycourier::TextStyle::TaggedSymbol)
      H1 = T.let(:h1, Trycourier::TextStyle::TaggedSymbol)
      H2 = T.let(:h2, Trycourier::TextStyle::TaggedSymbol)
      SUBTEXT = T.let(:subtext, Trycourier::TextStyle::TaggedSymbol)

      sig { override.returns(T::Array[Trycourier::TextStyle::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
