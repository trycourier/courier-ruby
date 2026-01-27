# typed: strong

module Courier
  module Models
    module UserProfileFirebaseToken
      extend Courier::Internal::Type::Union

      Variants = T.type_alias { T.any(String, T::Array[String]) }

      sig do
        override.returns(T::Array[Courier::UserProfileFirebaseToken::Variants])
      end
      def self.variants
      end

      StringArray =
        T.let(
          Courier::Internal::Type::ArrayOf[String],
          Courier::Internal::Type::Converter
        )
    end
  end
end
