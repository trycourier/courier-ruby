# typed: strong

module Courier
  module Models
    module JourneyState
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::JourneyState) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      DRAFT = T.let(:DRAFT, Courier::JourneyState::TaggedSymbol)
      PUBLISHED = T.let(:PUBLISHED, Courier::JourneyState::TaggedSymbol)

      sig { override.returns(T::Array[Courier::JourneyState::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
