# typed: strong

module Courier
  module Models
    module RoutingMethod
      extend Courier::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Courier::RoutingMethod) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      ALL = T.let(:all, Courier::RoutingMethod::TaggedSymbol)
      SINGLE = T.let(:single, Courier::RoutingMethod::TaggedSymbol)

      sig { override.returns(T::Array[Courier::RoutingMethod::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
