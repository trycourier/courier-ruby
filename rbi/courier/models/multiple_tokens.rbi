# typed: strong

module Courier
  module Models
    class MultipleTokens < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::MultipleTokens, Courier::Internal::AnyHash)
        end

      sig { returns(T::Array[Courier::Token]) }
      attr_accessor :tokens

      sig do
        params(tokens: T::Array[Courier::Token::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(tokens:)
      end

      sig { override.returns({ tokens: T::Array[Courier::Token] }) }
      def to_hash
      end
    end
  end
end
