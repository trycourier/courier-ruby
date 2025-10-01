# typed: strong

module Courier
  module Resources
    class Profiles
      sig { returns(Courier::Resources::Profiles::Lists) }
      attr_reader :lists

      # Merge the supplied values with an existing profile or create a new profile if
      # one doesn't already exist.
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

      # Returns the specified user profile.
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

      # Update a profile
      sig do
        params(
          user_id: String,
          patch: T::Array[Courier::ProfileUpdateParams::Patch::OrHash],
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def update(
        # A unique identifier representing the user associated with the requested profile.
        user_id,
        # List of patch operations to apply to the profile.
        patch:,
        request_options: {}
      )
      end

      # Deletes the specified user profile.
      sig do
        params(
          user_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # A unique identifier representing the user associated with the requested profile.
        user_id,
        request_options: {}
      )
      end

      # When using `PUT`, be sure to include all the key-value pairs required by the
      # recipient's profile. Any key-value pairs that exist in the profile but fail to
      # be included in the `PUT` request will be removed from the profile. Remember, a
      # `PUT` update is a full replacement of the data. For partial updates, use the
      # [Patch](https://www.courier.com/docs/reference/profiles/patch/) request.
      sig do
        params(
          user_id: String,
          profile: T::Hash[Symbol, T.anything],
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::ProfileReplaceResponse)
      end
      def replace(
        # A unique identifier representing the user associated with the requested profile.
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
