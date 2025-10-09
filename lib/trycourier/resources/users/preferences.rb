# frozen_string_literal: true

module Trycourier
  module Resources
    class Users
      class Preferences
        # Some parameter documentations has been truncated, see
        # {Trycourier::Models::Users::PreferenceRetrieveParams} for more details.
        #
        # Fetch all user preferences.
        #
        # @overload retrieve(user_id, tenant_id: nil, request_options: {})
        #
        # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retri
        #
        # @param tenant_id [String, nil] Query the preferences of a user for this specific tenant context.
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Users::PreferenceRetrieveResponse]
        #
        # @see Trycourier::Models::Users::PreferenceRetrieveParams
        def retrieve(user_id, params = {})
          parsed, options = Trycourier::Users::PreferenceRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["users/%1$s/preferences", user_id],
            query: parsed,
            model: Trycourier::Models::Users::PreferenceRetrieveResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Trycourier::Models::Users::PreferenceRetrieveTopicParams} for more details.
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
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Users::PreferenceRetrieveTopicResponse]
        #
        # @see Trycourier::Models::Users::PreferenceRetrieveTopicParams
        def retrieve_topic(topic_id, params)
          parsed, options = Trycourier::Users::PreferenceRetrieveTopicParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["users/%1$s/preferences/%2$s", user_id, topic_id],
            query: parsed,
            model: Trycourier::Models::Users::PreferenceRetrieveTopicResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Trycourier::Models::Users::PreferenceUpdateOrCreateTopicParams} for more
        # details.
        #
        # Update or Create user preferences for a specific subscription topic.
        #
        # @overload update_or_create_topic(topic_id, user_id:, topic:, tenant_id: nil, request_options: {})
        #
        # @param topic_id [String] Path param: A unique identifier associated with a subscription topic.
        #
        # @param user_id [String] Path param: A unique identifier associated with the user whose preferences you w
        #
        # @param topic [Trycourier::Models::Users::PreferenceUpdateOrCreateTopicParams::Topic] Body param:
        #
        # @param tenant_id [String, nil] Query param: Update the preferences of a user for this specific tenant context.
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Users::PreferenceUpdateOrCreateTopicResponse]
        #
        # @see Trycourier::Models::Users::PreferenceUpdateOrCreateTopicParams
        def update_or_create_topic(topic_id, params)
          parsed, options = Trycourier::Users::PreferenceUpdateOrCreateTopicParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          query_params = [:tenant_id]
          @client.request(
            method: :put,
            path: ["users/%1$s/preferences/%2$s", user_id, topic_id],
            query: parsed.slice(*query_params),
            body: parsed.except(*query_params),
            model: Trycourier::Models::Users::PreferenceUpdateOrCreateTopicResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Trycourier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
