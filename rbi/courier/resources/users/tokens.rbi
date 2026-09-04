# typed: strong

module Courier
  module Resources
    class Users
      # Register and manage the APNS and FCM device tokens Courier delivers push
      # notifications to.
      class Tokens
        # Returns one device token with its provider key, status and status reason, expiry
        # date, and any properties stored alongside it.
        sig do
          params(
            token: String,
            user_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Users::TokenRetrieveResponse)
        end
        def retrieve(
          # The full token string.
          token,
          # The user's ID. This can be any uniquely identifiable string.
          user_id:,
          request_options: {}
        )
        end

        # Applies a JSON Patch to a device token, changing its status, expiry, or
        # properties without re-registering it.
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
          # Body param
          patch:,
          request_options: {}
        )
        end

        # Returns every device token registered for a user, each with its provider key,
        # status, and expiry date.
        sig do
          params(
            user_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Users::TokenListResponse)
        end
        def list(
          # The user's ID. This can be any uniquely identifiable string.
          user_id,
          request_options: {}
        )
        end

        # Deletes one device token for a user, addressed by the token value, so push sends
        # no longer target that device.
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

        # Registers several device tokens for a user in one call, overwriting any stored
        # token with a matching value.
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

        # Registers one device token for a user against a provider key, overwriting the
        # token if it already exists. Push sends resolve tokens per user.
        sig do
          params(
            token: String,
            user_id: String,
            provider_key:
              Courier::Users::TokenAddSingleParams::ProviderKey::OrSymbol,
            device:
              T.nilable(Courier::Users::TokenAddSingleParams::Device::OrHash),
            expiry_date:
              T.nilable(
                Courier::Users::TokenAddSingleParams::ExpiryDate::Variants
              ),
            properties: T.anything,
            tracking:
              T.nilable(Courier::Users::TokenAddSingleParams::Tracking::OrHash),
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def add_single(
          # Path param: The full token string.
          token,
          # Path param: The user's ID. This can be any uniquely identifiable string.
          user_id:,
          # Body param
          provider_key:,
          # Body param: Information about the device the token came from.
          device: nil,
          # Body param: When the token expires. Accepts a date, or the boolean `false` to
          # disable expiration entirely. ISO 8601 is recommended (for example
          # `2026-10-25T00:00:00.000Z`). A value that cannot be parsed as a date is
          # rejected; it is not treated as "no expiration" and does not fall back to the
          # default. `true` is not a supported value. Omit the field to use the default,
          # which expires a token that has not been re-registered for 60 days.
          expiry_date: nil,
          # Body param: Properties about the token.
          properties: nil,
          # Body param: Tracking information about the device the token came from.
          tracking: nil,
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
