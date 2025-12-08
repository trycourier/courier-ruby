# typed: strong

module Trycourier
  module Models
    module Users
      class TokenListResponse < Trycourier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Trycourier::Models::Users::TokenListResponse,
              Trycourier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Trycourier::Users::UserToken]) }
        attr_accessor :tokens

        # A list of tokens registered with the user.
        sig do
          params(
            tokens: T::Array[Trycourier::Users::UserToken::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(tokens:)
        end

        sig do
          override.returns({ tokens: T::Array[Trycourier::Users::UserToken] })
        end
        def to_hash
        end
      end
    end
  end
end
