# frozen_string_literal: true

module Courier
  module Resources
    class Journeys
      # @return [Courier::Resources::Journeys::Templates]
      attr_reader :templates

      # Create a journey. Defaults to `DRAFT` state; pass `state: "PUBLISHED"` to
      # publish on create. Send nodes are not allowed on `POST`. The standard flow is:
      # create the journey shell here, add notification templates with
      # `POST /journeys/{templateId}/templates`, then wire them into the journey with
      # `PUT /journeys/{templateId}`. Call `POST /journeys/{templateId}/publish` to
      # publish a draft after the fact.
      #
      # @overload create(name:, nodes:, enabled: nil, state: nil, request_options: {})
      #
      # @param name [String]
      #
      # @param nodes [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>]
      #
      # @param enabled [Boolean]
      #
      # @param state [Symbol, Courier::Models::JourneyState] Lifecycle state of a journey.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneyResponse]
      #
      # @see Courier::Models::JourneyCreateParams
      def create(params)
        parsed, options = Courier::JourneyCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "journeys",
          body: parsed,
          model: Courier::JourneyResponse,
          options: options
        )
      end

      # Fetch a journey by id. Pass `?version=draft` (default `published`) to retrieve
      # the working draft, or `?version=vN` to retrieve a historical version.
      #
      # @overload retrieve(template_id, version: nil, request_options: {})
      #
      # @param template_id [String] Journey id
      #
      # @param version [String] Version selector: `draft`, `published` (default), or `vN`.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneyResponse]
      #
      # @see Courier::Models::JourneyRetrieveParams
      def retrieve(template_id, params = {})
        parsed, options = Courier::JourneyRetrieveParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["journeys/%1$s", template_id],
          query: query,
          model: Courier::JourneyResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::JourneyListParams} for more details.
      #
      # Get the list of journeys.
      #
      # @overload list(cursor: nil, version: nil, request_options: {})
      #
      # @param cursor [String] A cursor token for pagination. Use the cursor from the previous response to fetc
      #
      # @param version [Symbol, Courier::Models::JourneyListParams::Version] The version of journeys to retrieve. Accepted values are published (for publishe
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneysListResponse]
      #
      # @see Courier::Models::JourneyListParams
      def list(params = {})
        parsed, options = Courier::JourneyListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "journeys",
          query: query,
          model: Courier::JourneysListResponse,
          options: options
        )
      end

      # Archive a journey. Archived journeys cannot be invoked. Existing journey runs
      # continue to completion.
      #
      # @overload archive(template_id, request_options: {})
      #
      # @param template_id [String] Journey id
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::JourneyArchiveParams
      def archive(template_id, params = {})
        @client.request(
          method: :delete,
          path: ["journeys/%1$s", template_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::JourneyInvokeParams} for more details.
      #
      # Invoke a journey by id or alias to start a new run. The response includes a
      # `runId` identifying the run.
      #
      # @overload invoke(template_id, data: nil, profile: nil, user_id: nil, request_options: {})
      #
      # @param template_id [String] A unique identifier representing the journey to be invoked. Accepts a Journey ID
      #
      # @param data [Hash{Symbol=>Object}] Data payload passed to the journey. The expected shape can be predefined using t
      #
      # @param profile [Hash{Symbol=>Object}] Profile data for the user. Can contain contact information (email, phone_number)
      #
      # @param user_id [String] A unique identifier for the user. If not provided, the system will attempt to re
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneysInvokeResponse]
      #
      # @see Courier::Models::JourneyInvokeParams
      def invoke(template_id, params = {})
        parsed, options = Courier::JourneyInvokeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["journeys/%1$s/invoke", template_id],
          body: parsed,
          model: Courier::JourneysInvokeResponse,
          options: options
        )
      end

      # List published versions of a journey, ordered most recent first.
      #
      # @overload list_versions(template_id, request_options: {})
      #
      # @param template_id [String] Journey id
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneyVersionsListResponse]
      #
      # @see Courier::Models::JourneyListVersionsParams
      def list_versions(template_id, params = {})
        @client.request(
          method: :get,
          path: ["journeys/%1$s/versions", template_id],
          model: Courier::JourneyVersionsListResponse,
          options: params[:request_options]
        )
      end

      # Publish the current draft as a new version. Body is optional; pass
      # `{ "version": "vN" }` to roll back to a prior version instead. Returns 404 if
      # the journey has no draft to publish.
      #
      # @overload publish(template_id, version: nil, request_options: {})
      #
      # @param template_id [String] Journey id
      #
      # @param version [String]
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneyResponse]
      #
      # @see Courier::Models::JourneyPublishParams
      def publish(template_id, params = {})
        parsed, options = Courier::JourneyPublishParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["journeys/%1$s/publish", template_id],
          body: parsed,
          model: Courier::JourneyResponse,
          options: options
        )
      end

      # Replace the journey draft. Updates the working draft only; call
      # `POST /journeys/{templateId}/publish` to make it live, or pass
      # `state: "PUBLISHED"` in this request to publish immediately. Send-node
      # `template` ids must already exist and be scoped to this journey, and node ids
      # must not be claimed by another journey.
      #
      # @overload replace(template_id, name:, nodes:, enabled: nil, state: nil, request_options: {})
      #
      # @param template_id [String] Journey id
      #
      # @param name [String]
      #
      # @param nodes [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>]
      #
      # @param enabled [Boolean]
      #
      # @param state [Symbol, Courier::Models::JourneyState] Lifecycle state of a journey.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneyResponse]
      #
      # @see Courier::Models::JourneyReplaceParams
      def replace(template_id, params)
        parsed, options = Courier::JourneyReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["journeys/%1$s", template_id],
          body: parsed,
          model: Courier::JourneyResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @templates = Courier::Resources::Journeys::Templates.new(client: client)
      end
    end
  end
end
