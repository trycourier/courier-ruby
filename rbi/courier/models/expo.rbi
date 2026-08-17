# typed: strong

module Courier
  module Models
    # Expo push tokens. Supply either a single `token` or a `tokens` value.
    module Expo
      extend Courier::Internal::Type::Union

      Variants = T.type_alias { T.any(Courier::Token, Courier::MultipleTokens) }

      sig { override.returns(T::Array[Courier::Expo::Variants]) }
      def self.variants
      end
    end
  end
end
