# typed: strong

module Courier
  module Resources
    # Store the contact information Courier delivers to for each user — email, phone
    # number, push tokens, and any custom data you send to.
    class Profiles
      # Store the contact information Courier delivers to for each user — email, phone
      # number, push tokens, and any custom data you send to.
      sig { returns(Courier::Resources::Profiles::Lists) }
      attr_reader :lists

      # Merges the supplied values into a user's profile, creating it if absent and
      # leaving any key you omit untouched. Prefer this for everyday writes.
      sig do
        params(
          user_id: String,
          profile: T::Hash[Symbol, T.anything],
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::ProfileCreateResponse)
      end
      def create(
        # Path param: A unique identifier representing the user associated with the
        # requested profile.
        user_id,
        # Body param
        profile:,
        # Header param: A unique key that makes this request idempotent. If Courier
        # receives another request with the same `Idempotency-Key`, it returns the stored
        # response from the first request without performing the operation again
        # (including the original status code and any error). Use it to safely retry
        # `POST` requests after network failures without risking duplicate sends. The key
        # is scoped to this endpoint.
        idempotency_key: nil,
        # Header param: How long the idempotency key remains valid, as a Unix epoch
        # timestamp in seconds or an ISO 8601 date string. Only applies when
        # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
        # maximum is 1 year.
        x_idempotency_expiration: nil,
        request_options: {}
      )
      end

      # Returns a user's stored profile and preferences, including the email address,
      # phone number, and push tokens Courier can reach them on.
      sig do
        params(
          user_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::ProfileRetrieveResponse)
      end
      def retrieve(
        # A unique identifier representing the user associated with the requested profile.
        user_id,
        request_options: {}
      )
      end

      # Applies a JSON Patch to a user profile, adding, removing, or replacing
      # individual fields without sending the whole object.
      sig do
        params(
          user_id: String,
          patch: T::Array[Courier::ProfileUpdateParams::Patch::OrHash],
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def update(
        # A unique identifier representing the user associated with the requested user
        # profile.
        user_id,
        # List of patch operations to apply to the profile.
        patch:,
        request_options: {}
      )
      end

      # Deletes a user's profile and stored contact details. List subscriptions and
      # preferences are separate resources, so remove those too if required.
      sig do
        params(
          user_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # A unique identifier representing the user associated with the requested user
        # profile.
        user_id,
        request_options: {}
      )
      end

      # Overwrites a user profile in full, removing any key absent from the request
      # body. Use the patch endpoint when changing a single field.
      sig do
        params(
          user_id: String,
          profile: T::Hash[Symbol, T.anything],
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::ProfileReplaceResponse)
      end
      def replace(
        # A unique identifier representing the user associated with the requested user
        # profile.
        user_id,
        profile:,
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
