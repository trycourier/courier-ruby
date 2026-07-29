# frozen_string_literal: true

module Courier
  module Resources
    class WorkspacePreferences
      # Manage the workspace catalog of subscription topics, the sections that group
      # them, and publishing the preference page.
      class Topics
        # Some parameter documentations has been truncated, see
        # {Courier::Models::WorkspacePreferences::TopicCreateParams} for more details.
        #
        # Creates a subscription topic inside a workspace preference. The default status
        # sets whether users start opted in, opted out, or required.
        #
        # @overload create(section_id, default_status:, name:, allowed_preferences: nil, description: nil, include_unsubscribe_header: nil, routing_options: nil, topic_data: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
        #
        # @param section_id [String] Path param: Id of the workspace preference to create the topic in.
        #
        # @param default_status [Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::DefaultStatus] Body param: The default subscription status applied when a recipient has not set
        #
        # @param name [String] Body param: Human-readable name for the preference topic.
        #
        # @param allowed_preferences [Array<Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::AllowedPreference>, nil] Body param: Preference controls a recipient may customize for this topic. Defaul
        #
        # @param description [String, nil] Body param: Optional description shown under the topic on the hosted preferences
        #
        # @param include_unsubscribe_header [Boolean, nil] Body param: Whether to include a list-unsubscribe header on emails for this topi
        #
        # @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Body param: Default channels delivered for this topic. Defaults to empty if omit
        #
        # @param topic_data [Hash{Symbol=>Object}, nil] Body param: Arbitrary metadata associated with the topic.
        #
        # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
        #
        # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::WorkspacePreferenceTopicGetResponse]
        #
        # @see Courier::Models::WorkspacePreferences::TopicCreateParams
        def create(section_id, params)
          parsed, options = Courier::WorkspacePreferences::TopicCreateParams.dump_request(params)
          header_params =
            {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
          @client.request(
            method: :post,
            path: ["preferences/sections/%1$s/topics", section_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Courier::WorkspacePreferenceTopicGetResponse,
            options: options
          )
        end

        # Returns one subscription topic with its default status, routing options, allowed
        # preferences, and unsubscribe header setting.
        #
        # @overload retrieve(topic_id, section_id:, request_options: {})
        #
        # @param topic_id [String] Id of the subscription preference topic.
        #
        # @param section_id [String] Id of the workspace preference.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::WorkspacePreferenceTopicGetResponse]
        #
        # @see Courier::Models::WorkspacePreferences::TopicRetrieveParams
        def retrieve(topic_id, params)
          parsed, options = Courier::WorkspacePreferences::TopicRetrieveParams.dump_request(params)
          section_id =
            parsed.delete(:section_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["preferences/sections/%1$s/topics/%2$s", section_id, topic_id],
            model: Courier::WorkspacePreferenceTopicGetResponse,
            options: options
          )
        end

        # Returns the subscription topics inside a workspace preference, each with its
        # default status and routing options.
        #
        # @overload list(section_id, request_options: {})
        #
        # @param section_id [String] Id of the workspace preference.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::WorkspacePreferenceTopicListResponse]
        #
        # @see Courier::Models::WorkspacePreferences::TopicListParams
        def list(section_id, params = {})
          @client.request(
            method: :get,
            path: ["preferences/sections/%1$s/topics", section_id],
            model: Courier::WorkspacePreferenceTopicListResponse,
            options: params[:request_options]
          )
        end

        # Archives a subscription topic and removes it from its workspace preference,
        # addressed by section id and topic id.
        #
        # @overload archive(topic_id, section_id:, request_options: {})
        #
        # @param topic_id [String] Id of the subscription preference topic.
        #
        # @param section_id [String] Id of the workspace preference.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Courier::Models::WorkspacePreferences::TopicArchiveParams
        def archive(topic_id, params)
          parsed, options = Courier::WorkspacePreferences::TopicArchiveParams.dump_request(params)
          section_id =
            parsed.delete(:section_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["preferences/sections/%1$s/topics/%2$s", section_id, topic_id],
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::WorkspacePreferences::TopicReplaceParams} for more details.
        #
        # Replace a topic within a workspace preference. Full document replacement;
        # missing optional fields are cleared. Same 404 rules as GET.
        #
        # @overload replace(topic_id, section_id:, default_status:, name:, allowed_preferences: nil, description: nil, include_unsubscribe_header: nil, routing_options: nil, topic_data: nil, request_options: {})
        #
        # @param topic_id [String] Path param: Id of the subscription preference topic.
        #
        # @param section_id [String] Path param: Id of the workspace preference.
        #
        # @param default_status [Symbol, Courier::Models::WorkspacePreferenceTopicReplaceRequest::DefaultStatus] Body param: The default subscription status applied when a recipient has not set
        #
        # @param name [String] Body param: Human-readable name for the preference topic.
        #
        # @param allowed_preferences [Array<Symbol, Courier::Models::WorkspacePreferenceTopicReplaceRequest::AllowedPreference>, nil] Body param: Preference controls a recipient may customize. Omit to clear.
        #
        # @param description [String, nil] Body param: Optional description shown under the topic on the hosted preferences
        #
        # @param include_unsubscribe_header [Boolean, nil] Body param: Whether to include a list-unsubscribe header on emails for this topi
        #
        # @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Body param: Default channels delivered for this topic. Omit to clear.
        #
        # @param topic_data [Hash{Symbol=>Object}, nil] Body param: Arbitrary metadata associated with the topic. Omit to clear.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::WorkspacePreferenceTopicGetResponse]
        #
        # @see Courier::Models::WorkspacePreferences::TopicReplaceParams
        def replace(topic_id, params)
          parsed, options = Courier::WorkspacePreferences::TopicReplaceParams.dump_request(params)
          section_id =
            parsed.delete(:section_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["preferences/sections/%1$s/topics/%2$s", section_id, topic_id],
            body: parsed,
            model: Courier::WorkspacePreferenceTopicGetResponse,
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
