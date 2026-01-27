# typed: strong

module Courier
  module Models
    module WebhookMethod
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::WebhookMethod) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      POST = T.let(:POST, Courier::WebhookMethod::TaggedSymbol)
      PUT = T.let(:PUT, Courier::WebhookMethod::TaggedSymbol)

      sig { override.returns(T::Array[Courier::WebhookMethod::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
