# typed: strong

module Courier
  module Models
    module Users
      module PreferenceStatus
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Users::PreferenceStatus) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPTED_IN =
          T.let(:OPTED_IN, Courier::Users::PreferenceStatus::TaggedSymbol)
        OPTED_OUT =
          T.let(:OPTED_OUT, Courier::Users::PreferenceStatus::TaggedSymbol)
        REQUIRED =
          T.let(:REQUIRED, Courier::Users::PreferenceStatus::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::Users::PreferenceStatus::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
