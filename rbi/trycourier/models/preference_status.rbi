# typed: strong

module Trycourier
  module Models
    module PreferenceStatus
      extend Trycourier::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Trycourier::PreferenceStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      OPTED_IN = T.let(:OPTED_IN, Trycourier::PreferenceStatus::TaggedSymbol)
      OPTED_OUT = T.let(:OPTED_OUT, Trycourier::PreferenceStatus::TaggedSymbol)
      REQUIRED = T.let(:REQUIRED, Trycourier::PreferenceStatus::TaggedSymbol)

      sig do
        override.returns(T::Array[Trycourier::PreferenceStatus::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
