# typed: strong

module Trycourier
  module Models
    module WebhookProfileType
      extend Trycourier::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Trycourier::WebhookProfileType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      LIMITED = T.let(:limited, Trycourier::WebhookProfileType::TaggedSymbol)
      EXPANDED = T.let(:expanded, Trycourier::WebhookProfileType::TaggedSymbol)

      sig do
        override.returns(T::Array[Trycourier::WebhookProfileType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
