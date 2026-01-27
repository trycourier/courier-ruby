# typed: strong

module Courier
  module Models
    module TextStyle
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::TextStyle) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      TEXT = T.let(:text, Courier::TextStyle::TaggedSymbol)
      H1 = T.let(:h1, Courier::TextStyle::TaggedSymbol)
      H2 = T.let(:h2, Courier::TextStyle::TaggedSymbol)
      SUBTEXT = T.let(:subtext, Courier::TextStyle::TaggedSymbol)

      sig { override.returns(T::Array[Courier::TextStyle::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
