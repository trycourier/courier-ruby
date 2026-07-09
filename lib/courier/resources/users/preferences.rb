# frozen_string_literal: true

module Courier
  module Resources
    class Users
      class Preferences
        # Some parameter documentations has been truncated, see
        # {Courier::Models::Users::PreferenceRetrieveParams} for more details.
        #
        # Fetch all user preferences.
        #
        # @overload retrieve(user_id, tenant_id: nil, request_options: {})
        #
        # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retri
        #
        # @param tenant_id [String, nil] Query the preferences of a user for this specific tenant context.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Users::PreferenceRetrieveResponse]
        #
        # @see Courier::Models::Users::PreferenceRetrieveParams
        def retrieve(user_id, params = {})
          parsed, options = Courier::Users::PreferenceRetrieveParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["users/%1$s/preferences", user_id],
            query: query,
            model: Courier::Models::Users::PreferenceRetrieveResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Users::PreferenceBulkReplaceParams} for more details.
        #
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
        #
        # @overload bulk_replace(user_id, topics:, tenant_id: nil, request_options: {})
        #
        # @param user_id [String] Path param: A unique identifier associated with the user whose preferences you w
        #
        # @param topics [Array<Courier::Models::Users::PreferenceBulkReplaceParams::Topic>] Body param: The complete set of topic overrides for the user. Up to 50 topics ma
        #
        # @param tenant_id [String, nil] Query param: Update the preferences of a user for this specific tenant context.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Users::PreferenceBulkReplaceResponse]
        #
        # @see Courier::Models::Users::PreferenceBulkReplaceParams
        def bulk_replace(user_id, params)
          query_params = [:tenant_id]
          parsed, options = Courier::Users::PreferenceBulkReplaceParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :put,
            path: ["users/%1$s/preferences", user_id],
            query: query,
            body: parsed.except(*query_params),
            model: Courier::Models::Users::PreferenceBulkReplaceResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Users::PreferenceBulkUpdateParams} for more details.
        #
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
        #
        # @overload bulk_update(user_id, topics:, tenant_id: nil, request_options: {})
        #
        # @param user_id [String] Path param: A unique identifier associated with the user whose preferences you w
        #
        # @param topics [Array<Courier::Models::Users::PreferenceBulkUpdateParams::Topic>] Body param: The topics to create or update. Between 1 and 50 topics may be provi
        #
        # @param tenant_id [String, nil] Query param: Update the preferences of a user for this specific tenant context.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Users::PreferenceBulkUpdateResponse]
        #
        # @see Courier::Models::Users::PreferenceBulkUpdateParams
        def bulk_update(user_id, params)
          query_params = [:tenant_id]
          parsed, options = Courier::Users::PreferenceBulkUpdateParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :post,
            path: ["users/%1$s/preferences", user_id],
            query: query,
            body: parsed.except(*query_params),
            model: Courier::Models::Users::PreferenceBulkUpdateResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Users::PreferenceDeleteTopicParams} for more details.
        #
        # Remove a user's preferences for a specific subscription topic, resetting the
        # topic to its effective default. This operation is idempotent: deleting a
        # preference that does not exist succeeds with no error.
        #
        # @overload delete_topic(topic_id, user_id:, tenant_id: nil, request_options: {})
        #
        # @param topic_id [String] Path param: A unique identifier associated with a subscription topic.
        #
        # @param user_id [String] Path param: A unique identifier associated with the user whose preferences you w
        #
        # @param tenant_id [String, nil] Query param: Delete the preferences of a user for this specific tenant context.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::Users::PreferenceDeleteTopicParams
        def delete_topic(topic_id, params)
          parsed, options = Courier::Users::PreferenceDeleteTopicParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["users/%1$s/preferences/%2$s", user_id, topic_id],
            query: query,
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Users::PreferenceRetrieveTopicParams} for more details.
        #
        # Fetch user preferences for a specific subscription topic.
        #
        # @overload retrieve_topic(topic_id, user_id:, tenant_id: nil, request_options: {})
        #
        # @param topic_id [String] Path param: A unique identifier associated with a subscription topic.
        #
        # @param user_id [String] Path param: A unique identifier associated with the user whose preferences you w
        #
        # @param tenant_id [String, nil] Query param: Query the preferences of a user for this specific tenant context.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Users::PreferenceRetrieveTopicResponse]
        #
        # @see Courier::Models::Users::PreferenceRetrieveTopicParams
        def retrieve_topic(topic_id, params)
          parsed, options = Courier::Users::PreferenceRetrieveTopicParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["users/%1$s/preferences/%2$s", user_id, topic_id],
            query: query,
            model: Courier::Models::Users::PreferenceRetrieveTopicResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Users::PreferenceUpdateOrCreateTopicParams} for more details.
        #
        # Update or Create user preferences for a specific subscription topic.
        #
        # @overload update_or_create_topic(topic_id, user_id:, topic:, tenant_id: nil, request_options: {})
        #
        # @param topic_id [String] Path param: A unique identifier associated with a subscription topic.
        #
        # @param user_id [String] Path param: A unique identifier associated with the user whose preferences you w
        #
        # @param topic [Courier::Models::Users::PreferenceUpdateOrCreateTopicParams::Topic] Body param
        #
        # @param tenant_id [String, nil] Query param: Update the preferences of a user for this specific tenant context.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Users::PreferenceUpdateOrCreateTopicResponse]
        #
        # @see Courier::Models::Users::PreferenceUpdateOrCreateTopicParams
        def update_or_create_topic(topic_id, params)
          query_params = [:tenant_id]
          parsed, options = Courier::Users::PreferenceUpdateOrCreateTopicParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed.slice(*query_params))
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["users/%1$s/preferences/%2$s", user_id, topic_id],
            query: query,
            body: parsed.except(*query_params),
            model: Courier::Models::Users::PreferenceUpdateOrCreateTopicResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
