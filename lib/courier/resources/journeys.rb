# frozen_string_literal: true

module Courier
  module Resources
    class Journeys
      # @return [Courier::Resources::Journeys::Templates]
      attr_reader :templates

      # Some parameter documentations has been truncated, see
      # {Courier::Models::JourneyCreateParams} for more details.
      #
      # Creates a journey from a set of nodes, in draft state unless you pass a
      # published state. Send nodes cannot be included until their templates exist.
      #
      # @overload create(name:, nodes:, enabled: nil, state: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param name [String] Body param
      #
      # @param nodes [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyNode::JourneyBatchNode, Courier::Models::JourneyNode::JourneyAddToDigestNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>] Body param
      #
      # @param enabled [Boolean] Body param
      #
      # @param state [Symbol, Courier::Models::JourneyState] Body param: Lifecycle state of a journey.
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneyResponse]
      #
      # @see Courier::Models::JourneyCreateParams
      def create(params)
        parsed, options = Courier::JourneyCreateParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: "journeys",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
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
      # Lists the workspace's journeys, each carrying a name, state, and enabled flag.
      # Paged by cursor.
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

      # Archives a journey so it can no longer be invoked. Runs already in flight
      # continue to completion, so archiving never strands a user mid-sequence.
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
      # {Courier::Models::JourneyCancelParams} for more details.
      #
      # Cancels in-flight journey runs, either every run sharing a cancelation token or
      # one run by id. Use it to stop a sequence when the event resolves.
      #
      # @overload cancel(cancel_journey_request:, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param cancel_journey_request [Courier::Models::CancelJourneyRequest::ByCancelationToken, Courier::Models::CancelJourneyRequest::ByRunID] Body param: Request body for `POST /journeys/cancel`. Provide EXACTLY ONE of `ca
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::CancelJourneyResponse::TokenBranch, Courier::Models::CancelJourneyResponse::RunIDBranch]
      #
      # @see Courier::Models::JourneyCancelParams
      def cancel(params)
        parsed, options = Courier::JourneyCancelParams.dump_request(params)
        @client.request(
          method: :post,
          path: "journeys/cancel",
          headers: parsed.except(:cancel_journey_request).transform_keys(
            idempotency_key: "idempotency-key",
            x_idempotency_expiration: "x-idempotency-expiration"
          ),
          body: parsed[:cancel_journey_request],
          model: Courier::CancelJourneyResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::JourneyInvokeParams} for more details.
      #
      # Starts a journey run for one user and returns a runId. Runs execute
      # asynchronously, so the response arrives before any message is sent.
      #
      # @overload invoke(template_id, data: nil, profile: nil, user_id: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param template_id [String] Path param: A unique identifier representing the journey to be invoked. Accepts
      #
      # @param data [Hash{Symbol=>Object}] Body param: Data payload passed to the journey. The expected shape can be predef
      #
      # @param profile [Hash{Symbol=>Object}] Body param: Profile data for the user. Can contain contact information (email, p
      #
      # @param user_id [String] Body param: A unique identifier for the user. If not provided, the system will a
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneysInvokeResponse]
      #
      # @see Courier::Models::JourneyInvokeParams
      def invoke(template_id, params = {})
        parsed, options = Courier::JourneyInvokeParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: ["journeys/%1$s/invoke", template_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Courier::JourneysInvokeResponse,
          options: options
        )
      end

      # Lists a journey's published versions, most recent first, so you have a version
      # id to roll back to. Paged by cursor.
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

      # Some parameter documentations has been truncated, see
      # {Courier::Models::JourneyPublishParams} for more details.
      #
      # Publishes a journey's current draft as a new version, making it live for new
      # runs. Pass a version instead to roll back to an earlier one.
      #
      # @overload publish(template_id, version: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param template_id [String] Path param: Journey id
      #
      # @param version [String] Body param
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::JourneyResponse]
      #
      # @see Courier::Models::JourneyPublishParams
      def publish(template_id, params = {})
        parsed, options = Courier::JourneyPublishParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: ["journeys/%1$s/publish", template_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Courier::JourneyResponse,
          options: options
        )
      end

      # Replaces a journey's working draft, leaving the published version live until you
      # publish. Reach for this when editing a journey already running.
      #
      # @overload replace(template_id, name:, nodes:, enabled: nil, state: nil, request_options: {})
      #
      # @param template_id [String] Journey id
      #
      # @param name [String]
      #
      # @param nodes [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyNode::JourneyBatchNode, Courier::Models::JourneyNode::JourneyAddToDigestNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>]
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
