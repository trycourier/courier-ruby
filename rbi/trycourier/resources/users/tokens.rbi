# typed: strong

module Trycourier
  module Resources
    class Users
      class Tokens
        # Get single token available for a `:token`
        sig do
          params(
            token: String,
            user_id: String,
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(Trycourier::Models::Users::TokenRetrieveResponse)
        end
        def retrieve(
          # The full token string.
          token,
          # The user's ID. This can be any uniquely identifiable string.
          user_id:,
          request_options: {}
        )
        end

        # Apply a JSON Patch (RFC 6902) to the specified token.
        sig do
          params(
            token: String,
            user_id: String,
            patch:
              T::Array[Trycourier::Users::TokenUpdateParams::Patch::OrHash],
            request_options: Trycourier::RequestOptions::OrHash
          ).void
        end
        def update(
          # Path param: The full token string.
          token,
          # Path param: The user's ID. This can be any uniquely identifiable string.
          user_id:,
          # Body param:
          patch:,
          request_options: {}
        )
        end

        # Gets all tokens available for a :user_id
        sig do
          params(
            user_id: String,
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(T::Array[Trycourier::Users::UserToken])
        end
        def list(
          # The user's ID. This can be any uniquely identifiable string.
          user_id,
          request_options: {}
        )
        end

        # Delete User Token
        sig do
          params(
            token: String,
            user_id: String,
            request_options: Trycourier::RequestOptions::OrHash
          ).void
        end
        def delete(
          # The full token string.
          token,
          # The user's ID. This can be any uniquely identifiable string.
          user_id:,
          request_options: {}
        )
        end

        # Adds multiple tokens to a user and overwrites matching existing tokens.
        sig do
          params(
            user_id: String,
            request_options: Trycourier::RequestOptions::OrHash
          ).void
        end
        def add_multiple(
          # The user's ID. This can be any uniquely identifiable string.
          user_id,
          request_options: {}
        )
        end

        # Adds a single token to a user and overwrites a matching existing token.
        sig do
          params(
            path_token: String,
            user_id: String,
            body_token: String,
            provider_key: Trycourier::Users::UserToken::ProviderKey::OrSymbol,
            device: T.nilable(Trycourier::Users::UserToken::Device::OrHash),
            expiry_date:
              T.nilable(Trycourier::Users::UserToken::ExpiryDate::Variants),
            properties: T.anything,
            tracking: T.nilable(Trycourier::Users::UserToken::Tracking::OrHash),
            request_options: Trycourier::RequestOptions::OrHash
          ).void
        end
        def add_single(
          # Path param: The full token string.
          path_token,
          # Path param: The user's ID. This can be any uniquely identifiable string.
          user_id:,
          # Body param: Full body of the token. Must match token in URL path parameter.
          body_token:,
          # Body param:
          provider_key:,
          # Body param: Information about the device the token came from.
          device: nil,
          # Body param: ISO 8601 formatted date the token expires. Defaults to 2 months. Set
          # to false to disable expiration.
          expiry_date: nil,
          # Body param: Properties sent to the provider along with the token
          properties: nil,
          # Body param: Tracking information about the device the token came from.
          tracking: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Trycourier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
