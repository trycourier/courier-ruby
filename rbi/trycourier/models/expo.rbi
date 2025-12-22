# typed: strong

module Trycourier
  module Models
    module Expo
      extend Trycourier::Internal::Type::Union

      Variants =
        T.type_alias { T.any(Trycourier::Token, Trycourier::MultipleTokens) }

      sig { override.returns(T::Array[Trycourier::Expo::Variants]) }
      def self.variants
      end
    end
  end
end
