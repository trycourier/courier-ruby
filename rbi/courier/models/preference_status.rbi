# typed: strong

module Courier
  module Models
    module PreferenceStatus
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::PreferenceStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      OPTED_IN = T.let(:OPTED_IN, Courier::PreferenceStatus::TaggedSymbol)
      OPTED_OUT = T.let(:OPTED_OUT, Courier::PreferenceStatus::TaggedSymbol)
      REQUIRED = T.let(:REQUIRED, Courier::PreferenceStatus::TaggedSymbol)

      sig do
        override.returns(T::Array[Courier::PreferenceStatus::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
