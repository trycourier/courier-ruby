# typed: strong

module Courier
  module Models
    module Users
      class TokenListResponse < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::Models::Users::TokenListResponse,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Courier::Users::UserToken]) }
        attr_accessor :tokens

        # A list of tokens registered with the user.
        sig do
          params(tokens: T::Array[Courier::Users::UserToken::OrHash]).returns(
            T.attached_class
          )
        end
        def self.new(tokens:)
        end

        sig do
          override.returns({ tokens: T::Array[Courier::Users::UserToken] })
        end
        def to_hash
        end
      end
    end
  end
end
