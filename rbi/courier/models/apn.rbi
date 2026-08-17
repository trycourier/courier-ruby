# typed: strong

module Courier
  module Models
    # Apple Push Notification device tokens. Supply either a single `token` or a
    # `tokens` value. A bare string is rejected by the provider — the token must be
    # wrapped in this object.
    module Apn
      extend Courier::Internal::Type::Union

      Variants = T.type_alias { T.any(Courier::Token, Courier::MultipleTokens) }

      sig { override.returns(T::Array[Courier::Apn::Variants]) }
      def self.variants
      end
    end
  end
end
