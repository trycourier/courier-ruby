# typed: strong

module Trycourier
  module Models
    module WebhookMethod
      extend Trycourier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Trycourier::WebhookMethod) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      POST = T.let(:POST, Trycourier::WebhookMethod::TaggedSymbol)
      PUT = T.let(:PUT, Trycourier::WebhookMethod::TaggedSymbol)

      sig do
        override.returns(T::Array[Trycourier::WebhookMethod::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
