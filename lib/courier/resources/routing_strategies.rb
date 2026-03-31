# frozen_string_literal: true

module Courier
  module Resources
    class RoutingStrategies
      # Create a routing strategy. Requires a name and routing configuration at minimum.
      # Channels and providers default to empty if omitted.
      #
      # @overload create(name:, routing:, channels: nil, description: nil, providers: nil, tags: nil, request_options: {})
      #
      # @param name [String] Human-readable name for the routing strategy.
      #
      # @param routing [Courier::Models::MessageRouting] Routing tree defining channel selection method and order.
      #
      # @param channels [Hash{Symbol=>Courier::Models::Channel}, nil] Per-channel delivery configuration. Defaults to empty if omitted.
      #
      # @param description [String, nil] Optional description of the routing strategy.
      #
      # @param providers [Hash{Symbol=>Courier::Models::MessageProvidersType}, nil] Per-provider delivery configuration. Defaults to empty if omitted.
      #
      # @param tags [Array<String>, nil] Optional tags for categorization.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::RoutingStrategyMutationResponse]
      #
      # @see Courier::Models::RoutingStrategyCreateParams
      def create(params)
        parsed, options = Courier::RoutingStrategyCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "routing-strategies",
          body: parsed,
          model: Courier::RoutingStrategyMutationResponse,
          options: options
        )
      end

      # Retrieve a routing strategy by ID. Returns the full entity including routing
      # content and metadata.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Routing strategy ID (rs\_ prefix).
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::RoutingStrategyGetResponse]
      #
      # @see Courier::Models::RoutingStrategyRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["routing-strategies/%1$s", id],
          model: Courier::RoutingStrategyGetResponse,
          options: params[:request_options]
        )
      end

      # List routing strategies in your workspace. Returns metadata only (no
      # routing/channels/providers content). Use GET /routing-strategies/{id} for full
      # details.
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String, nil] Opaque pagination cursor from a previous response. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of results per page. Default 20, max 100.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::RoutingStrategyListResponse]
      #
      # @see Courier::Models::RoutingStrategyListParams
      def list(params = {})
        parsed, options = Courier::RoutingStrategyListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "routing-strategies",
          query: query,
          model: Courier::RoutingStrategyListResponse,
          options: options
        )
      end

      # Archive a routing strategy. The strategy must not have associated notification
      # templates. Unlink all templates before archiving.
      #
      # @overload archive(id, request_options: {})
      #
      # @param id [String] Routing strategy ID (rs\_ prefix).
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::RoutingStrategyArchiveParams
      def archive(id, params = {})
        @client.request(
          method: :delete,
          path: ["routing-strategies/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Replace a routing strategy. Full document replacement; the caller must send the
      # complete desired state. Missing optional fields are cleared.
      #
      # @overload replace(id, name:, routing:, channels: nil, description: nil, providers: nil, tags: nil, request_options: {})
      #
      # @param id [String] Routing strategy ID (rs\_ prefix).
      #
      # @param name [String] Human-readable name for the routing strategy.
      #
      # @param routing [Courier::Models::MessageRouting] Routing tree defining channel selection method and order.
      #
      # @param channels [Hash{Symbol=>Courier::Models::Channel}, nil] Per-channel delivery configuration. Omit to clear.
      #
      # @param description [String, nil] Optional description. Omit or null to clear.
      #
      # @param providers [Hash{Symbol=>Courier::Models::MessageProvidersType}, nil] Per-provider delivery configuration. Omit to clear.
      #
      # @param tags [Array<String>, nil] Optional tags. Omit or null to clear.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::RoutingStrategyMutationResponse]
      #
      # @see Courier::Models::RoutingStrategyReplaceParams
      def replace(id, params)
        parsed, options = Courier::RoutingStrategyReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["routing-strategies/%1$s", id],
          body: parsed,
          model: Courier::RoutingStrategyMutationResponse,
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
