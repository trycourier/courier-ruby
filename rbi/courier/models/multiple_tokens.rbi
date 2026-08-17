# typed: strong

module Courier
  module Models
    class MultipleTokens < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::MultipleTokens, Courier::Internal::AnyHash)
        end

      # One device token, or an array of them. The values are the token strings
      # themselves — not objects.
      sig { returns(Courier::MultipleTokens::Tokens::Variants) }
      attr_accessor :tokens

      sig do
        params(tokens: Courier::MultipleTokens::Tokens::Variants).returns(
          T.attached_class
        )
      end
      def self.new(
        # One device token, or an array of them. The values are the token strings
        # themselves — not objects.
        tokens:
      )
      end

      sig do
        override.returns({ tokens: Courier::MultipleTokens::Tokens::Variants })
      end
      def to_hash
      end

      # One device token, or an array of them. The values are the token strings
      # themselves — not objects.
      module Tokens
        extend Courier::Internal::Type::Union

        Variants = T.type_alias { T.any(String, T::Array[String]) }

        sig do
          override.returns(T::Array[Courier::MultipleTokens::Tokens::Variants])
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
end
