# typed: strong

module Courier
  module Resources
    class Users
      class Tokens
        # Apply a JSON Patch (RFC 6902) to the specified token.
        sig do
          params(
            token: String,
            user_id: String,
            patch: T::Array[Courier::Users::TokenUpdateParams::Patch::OrHash],
            request_options: Courier::RequestOptions::OrHash
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
            request_options: Courier::RequestOptions::OrHash
          ).returns(T::Array[Courier::Users::UserToken])
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
            request_options: Courier::RequestOptions::OrHash
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
            request_options: Courier::RequestOptions::OrHash
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
            provider_key: Courier::Users::UserToken::ProviderKey::OrSymbol,
            body_token: T.nilable(String),
            device: T.nilable(Courier::Users::UserToken::Device::OrHash),
            expiry_date:
              T.nilable(Courier::Users::UserToken::ExpiryDate::Variants),
            properties: T.anything,
            tracking: T.nilable(Courier::Users::UserToken::Tracking::OrHash),
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def add_single(
          # Path param: The full token string.
          path_token,
          # Path param: The user's ID. This can be any uniquely identifiable string.
          user_id:,
          # Body param:
          provider_key:,
          # Body param: Full body of the token. Must match token in URL.
          body_token: nil,
          # Body param: Information about the device the token is associated with.
          device: nil,
          # Body param: ISO 8601 formatted date the token expires. Defaults to 2 months. Set
          # to false to disable expiration.
          expiry_date: nil,
          # Body param: Properties sent to the provider along with the token
          properties: nil,
          # Body param: Information about the device the token is associated with.
          tracking: nil,
          request_options: {}
        )
        end

        # Get single token available for a `:token`
        sig do
          params(
            token: String,
            user_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Users::TokenRetrieveSingleResponse)
        end
        def retrieve_single(
          # The full token string.
          token,
          # The user's ID. This can be any uniquely identifiable string.
          user_id:,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
