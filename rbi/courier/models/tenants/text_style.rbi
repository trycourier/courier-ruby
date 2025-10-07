# typed: strong

module Courier
  module Models
    module Tenants
      module TextStyle
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Tenants::TextStyle) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT = T.let(:text, Courier::Tenants::TextStyle::TaggedSymbol)
        H1 = T.let(:h1, Courier::Tenants::TextStyle::TaggedSymbol)
        H2 = T.let(:h2, Courier::Tenants::TextStyle::TaggedSymbol)
        SUBTEXT = T.let(:subtext, Courier::Tenants::TextStyle::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::Tenants::TextStyle::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
