# typed: strong

module Trycourier
  module Models
    class MultipleTokens < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::MultipleTokens, Trycourier::Internal::AnyHash)
        end

      sig { returns(T::Array[Trycourier::Token]) }
      attr_accessor :tokens

      sig do
        params(tokens: T::Array[Trycourier::Token::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(tokens:)
      end

      sig { override.returns({ tokens: T::Array[Trycourier::Token] }) }
      def to_hash
      end
    end
  end
end
