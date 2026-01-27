# typed: strong

module Courier
  module Models
    module WebhookAuthMode
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::WebhookAuthMode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      NONE = T.let(:none, Courier::WebhookAuthMode::TaggedSymbol)
      BASIC = T.let(:basic, Courier::WebhookAuthMode::TaggedSymbol)
      BEARER = T.let(:bearer, Courier::WebhookAuthMode::TaggedSymbol)

      sig { override.returns(T::Array[Courier::WebhookAuthMode::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
