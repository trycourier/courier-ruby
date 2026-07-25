# frozen_string_literal: true

module Courier
  module Resources
    class Users
      class Preferences
        # Some parameter documentations has been truncated, see
        # {Courier::Models::Users::PreferenceRetrieveParams} for more details.
        #
        # Returns a user's preference overrides with paging, one entry per subscription
        # topic they have set a choice for.
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
        # Replaces a user's entire set of preference overrides. Any topic you leave out is
        # reset to its default, so send the full set rather than a subset.
        #
        # @overload bulk_replace(user_id, topics:, tenant_id: nil, request_options: {})
        #
        # @param user_id [String] Path param: A unique identifier associated with the user whose preferences you w
        #
        # @param topics [Array<Courier::Models::Users::PreferenceBulkReplaceParams::Topic>] Body param: The complete set of topic overrides for the user. Up to 50 topics ma
        #
        # @param tenant_id [String, nil] Query param: Replace the preferences of a user for this specific tenant context.
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
        # Adds or updates a user's preferences for several subscription topics at once.
        # Topics you leave out keep whatever they were set to before.
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
        # Removes a user's override for one subscription topic, resetting it to the
        # effective default from the tenant or workspace.
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
        # Returns a user's opt-in status and channel choices for one subscription topic,
        # or the effective default if they have set no override.
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
        # Sets a user's opt-in status and channel choices for one subscription topic,
        # overriding the tenant default for that topic only.
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
