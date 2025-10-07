# typed: strong

module Courier
  module Models
    module Tenants
      module Alignment
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Tenants::Alignment) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CENTER = T.let(:center, Courier::Tenants::Alignment::TaggedSymbol)
        LEFT = T.let(:left, Courier::Tenants::Alignment::TaggedSymbol)
        RIGHT = T.let(:right, Courier::Tenants::Alignment::TaggedSymbol)
        FULL = T.let(:full, Courier::Tenants::Alignment::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::Tenants::Alignment::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
