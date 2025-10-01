# typed: strong

module Courier
  module Models
    module Automations
      module MergeAlgorithm
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Automations::MergeAlgorithm) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REPLACE =
          T.let(:replace, Courier::Automations::MergeAlgorithm::TaggedSymbol)
        NONE = T.let(:none, Courier::Automations::MergeAlgorithm::TaggedSymbol)
        OVERWRITE =
          T.let(:overwrite, Courier::Automations::MergeAlgorithm::TaggedSymbol)
        SOFT_MERGE =
          T.let(
            :"soft-merge",
            Courier::Automations::MergeAlgorithm::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::Automations::MergeAlgorithm::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
