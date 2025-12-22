# typed: strong

module Trycourier
  module Models
    module UserProfileFirebaseToken
      extend Trycourier::Internal::Type::Union

      Variants = T.type_alias { T.any(String, T::Array[String]) }

      sig do
        override.returns(
          T::Array[Trycourier::UserProfileFirebaseToken::Variants]
        )
      end
      def self.variants
      end

      StringArray =
        T.let(
          Trycourier::Internal::Type::ArrayOf[String],
          Trycourier::Internal::Type::Converter
        )
    end
  end
end
