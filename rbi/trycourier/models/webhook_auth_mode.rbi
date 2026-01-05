# typed: strong

module Trycourier
  module Models
    module WebhookAuthMode
      extend Trycourier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Trycourier::WebhookAuthMode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      NONE = T.let(:none, Trycourier::WebhookAuthMode::TaggedSymbol)
      BASIC = T.let(:basic, Trycourier::WebhookAuthMode::TaggedSymbol)
      BEARER = T.let(:bearer, Trycourier::WebhookAuthMode::TaggedSymbol)

      sig do
        override.returns(T::Array[Trycourier::WebhookAuthMode::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
