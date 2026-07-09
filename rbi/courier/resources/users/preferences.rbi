# typed: strong

module Courier
  module Resources
    class Users
      class Preferences
        # Fetch all user preferences.
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

        # Replace a user's complete set of preference overrides in a single request. The
        # topics in the request body become the recipient's entire set of overrides:
        # listed topics are created or updated, and every existing override that is not
        # included in the body is reset to its topic default. Submitting an empty `topics`
        # array is a valid clear-all that resets every existing override.
        #
        # This operation is validation-atomic (all-or-nothing): structural validation
        # fails fast with a single `400`, and if any topic is semantically invalid (an
        # unknown topic, a `REQUIRED` topic that cannot be opted out, or a custom routing
        # request that is not available on the workspace's plan) the request returns a
        # single `400` aggregating every failure in `errors` and writes nothing. On
        # success it returns `200` with `items` (the complete resulting override set) and
        # `deleted` (the ids of the overrides that were reset to default).
        #
        # Every `topic_id` in the response — in `items`, `deleted`, and any `errors` — is
        # returned in Courier's canonical topic id form, regardless of the form supplied
        # in the request.
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
          # Query param: Update the preferences of a user for this specific tenant context.
          tenant_id: nil,
          request_options: {}
        )
        end

        # Additively create or update a user's preferences for one or more subscription
        # topics in a single request. Only the topics included in the request body are
        # created or updated; any existing overrides for topics not listed are left
        # untouched.
        #
        # Structural validation of the request body fails fast with a single `400`. Beyond
        # that, each topic is processed independently (partial-success, not
        # all-or-nothing): valid topics are written and returned in `items`, while topics
        # that cannot be applied are collected in `errors` with a per-topic `reason` (for
        # example an unknown topic, a `REQUIRED` topic that cannot be opted out, a custom
        # routing request that is not available on the workspace's plan, or a write
        # failure). The request therefore returns `200` with both lists whenever the body
        # is structurally valid.
        #
        # Every `topic_id` in the response — in both `items` and `errors` — is returned in
        # Courier's canonical topic id form, regardless of the form supplied in the
        # request.
        sig do
          params(
            user_id: String,
            topics:
              T::Array[
                Courier::Users::PreferenceBulkUpdateParams::Topic::OrHash
              ],
            tenant_id: T.nilable(String),
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
          request_options: {}
        )
        end

        # Remove a user's preferences for a specific subscription topic, resetting the
        # topic to its effective default. This operation is idempotent: deleting a
        # preference that does not exist succeeds with no error.
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

        # Fetch user preferences for a specific subscription topic.
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

        # Update or Create user preferences for a specific subscription topic.
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
