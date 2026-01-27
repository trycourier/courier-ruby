# typed: strong

module Courier
  module Models
    module WebhookProfileType
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::WebhookProfileType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      LIMITED = T.let(:limited, Courier::WebhookProfileType::TaggedSymbol)
      EXPANDED = T.let(:expanded, Courier::WebhookProfileType::TaggedSymbol)

      sig do
        override.returns(T::Array[Courier::WebhookProfileType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
