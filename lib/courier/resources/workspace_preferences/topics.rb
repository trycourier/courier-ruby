# frozen_string_literal: true

module Courier
  module Resources
    class WorkspacePreferences
      class Topics
        # Some parameter documentations has been truncated, see
        # {Courier::Models::WorkspacePreferences::TopicCreateParams} for more details.
        #
        # Create a subscription preference topic inside a workspace preference. Fails with
        # 404 if the workspace preference does not exist. The topic id is generated and
        # returned.
        #
        # @overload create(section_id, default_status:, name:, allowed_preferences: nil, include_unsubscribe_header: nil, routing_options: nil, topic_data: nil, request_options: {})
        #
        # @param section_id [String] Id of the workspace preference to create the topic in.
        #
        # @param default_status [Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::DefaultStatus] The default subscription status applied when a recipient has not set their own.
        #
        # @param name [String] Human-readable name for the preference topic.
        #
        # @param allowed_preferences [Array<Symbol, Courier::Models::WorkspacePreferenceTopicCreateRequest::AllowedPreference>, nil] Preference controls a recipient may customize for this topic. Defaults to empty
        #
        # @param include_unsubscribe_header [Boolean, nil] Whether to include a list-unsubscribe header on emails for this topic.
        #
        # @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels delivered for this topic. Defaults to empty if omitted.
        #
        # @param topic_data [Hash{Symbol=>Object}, nil] Arbitrary metadata associated with the topic.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::WorkspacePreferenceTopicGetResponse]
        #
        # @see Courier::Models::WorkspacePreferences::TopicCreateParams
        def create(section_id, params)
          parsed, options = Courier::WorkspacePreferences::TopicCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["preferences/sections/%1$s/topics", section_id],
            body: parsed,
            model: Courier::WorkspacePreferenceTopicGetResponse,
            options: options
          )
        end

        # Retrieve a topic within a workspace preference. Returns 404 if the workspace
        # preference does not exist, the topic does not exist, or the topic belongs to a
        # different workspace preference.
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

        # List the topics in a workspace preference.
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

        # Archive a topic and remove it from its workspace preference. Same 404 rules as
        # GET.
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
        # @overload replace(topic_id, section_id:, default_status:, name:, allowed_preferences: nil, include_unsubscribe_header: nil, routing_options: nil, topic_data: nil, request_options: {})
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
