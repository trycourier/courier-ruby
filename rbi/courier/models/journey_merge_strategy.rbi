# typed: strong

module Courier
  module Models
    module JourneyMergeStrategy
      extend Courier::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Courier::JourneyMergeStrategy) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      OVERWRITE = T.let(:overwrite, Courier::JourneyMergeStrategy::TaggedSymbol)
      SOFT_MERGE =
        T.let(:"soft-merge", Courier::JourneyMergeStrategy::TaggedSymbol)
      REPLACE = T.let(:replace, Courier::JourneyMergeStrategy::TaggedSymbol)
      NONE = T.let(:none, Courier::JourneyMergeStrategy::TaggedSymbol)

      sig do
        override.returns(T::Array[Courier::JourneyMergeStrategy::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
