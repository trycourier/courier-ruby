# typed: strong

module Courier
  module Resources
    class Users
      class Preferences
        # Returns a user's preference overrides with paging, one entry per subscription
        # topic they have set a choice for.
        sig do
          params(
            user_id: String,
            tenant_id: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Users::PreferenceRetrieveResponse)
        end
        def retrieve(
          # A unique identifier associated with the user whose preferences you wish to
          # retrieve.
          user_id,
          # Query the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        # Replaces a user's entire set of preference overrides. Any topic you leave out is
        # reset to its default, so send the full set rather than a subset.
        sig do
          params(
            user_id: String,
            topics:
              T::Array[
                Courier::Users::PreferenceBulkReplaceParams::Topic::OrHash
              ],
            tenant_id: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Users::PreferenceBulkReplaceResponse)
        end
        def bulk_replace(
          # Path param: A unique identifier associated with the user whose preferences you
          # wish to update.
          user_id,
          # Body param: The complete set of topic overrides for the user. Up to 50 topics
          # may be provided. Any existing override not listed here is reset to its topic
          # default; an empty array resets every existing override.
          topics:,
          # Query param: Replace the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        # Adds or updates a user's preferences for several subscription topics at once.
        # Topics you leave out keep whatever they were set to before.
        sig do
          params(
            user_id: String,
            topics:
              T::Array[
                Courier::Users::PreferenceBulkUpdateParams::Topic::OrHash
              ],
            tenant_id: T.nilable(String),
            idempotency_key: String,
            x_idempotency_expiration: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Users::PreferenceBulkUpdateResponse)
        end
        def bulk_update(
          # Path param: A unique identifier associated with the user whose preferences you
          # wish to update.
          user_id,
          # Body param: The topics to create or update. Between 1 and 50 topics may be
          # provided in a single request.
          topics:,
          # Query param: Update the preferences of a user for this specific tenant context.
          tenant_id: nil,
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

        # Removes a user's override for one subscription topic, resetting it to the
        # effective default from the tenant or workspace.
        sig do
          params(
            topic_id: String,
            user_id: String,
            tenant_id: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def delete_topic(
          # Path param: A unique identifier associated with a subscription topic.
          topic_id,
          # Path param: A unique identifier associated with the user whose preferences you
          # wish to delete.
          user_id:,
          # Query param: Delete the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        # Returns a user's opt-in status and channel choices for one subscription topic,
        # or the effective default if they have set no override.
        sig do
          params(
            topic_id: String,
            user_id: String,
            tenant_id: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Users::PreferenceRetrieveTopicResponse)
        end
        def retrieve_topic(
          # Path param: A unique identifier associated with a subscription topic.
          topic_id,
          # Path param: A unique identifier associated with the user whose preferences you
          # wish to retrieve.
          user_id:,
          # Query param: Query the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        # Sets a user's opt-in status and channel choices for one subscription topic,
        # overriding the tenant default for that topic only.
        sig do
          params(
            topic_id: String,
            user_id: String,
            topic:
              Courier::Users::PreferenceUpdateOrCreateTopicParams::Topic::OrHash,
            tenant_id: T.nilable(String),
            request_options: Courier::RequestOptions::OrHash
          ).returns(
            Courier::Models::Users::PreferenceUpdateOrCreateTopicResponse
          )
        end
        def update_or_create_topic(
          # Path param: A unique identifier associated with a subscription topic.
          topic_id,
          # Path param: A unique identifier associated with the user whose preferences you
          # wish to retrieve.
          user_id:,
          # Body param
          topic:,
          # Query param: Update the preferences of a user for this specific tenant context.
          tenant_id: nil,
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
