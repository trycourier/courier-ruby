# typed: strong

module Courier
  module Resources
    class Profiles
      sig { returns(Courier::Resources::Profiles::Lists) }
      attr_reader :lists

      # Merges the supplied values into a user's profile, creating it if absent and
      # leaving any key you omit untouched. Prefer this for everyday writes.
      sig do
        params(
          user_id: String,
          profile: T::Hash[Symbol, T.anything],
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::ProfileCreateResponse)
      end
      def create(
        # A unique identifier representing the user associated with the requested profile.
        user_id,
        profile:,
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
