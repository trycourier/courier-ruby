# typed: strong

module Courier
  module Resources
    class RoutingStrategies
      # Create a routing strategy. Requires a name and routing configuration at minimum.
      # Channels and providers default to empty if omitted.
      sig do
        params(
          name: String,
          routing: Courier::MessageRouting::OrHash,
          channels: T.nilable(T::Hash[Symbol, Courier::Channel::OrHash]),
          description: T.nilable(String),
          providers:
            T.nilable(T::Hash[Symbol, Courier::MessageProvidersType::OrHash]),
          tags: T.nilable(T::Array[String]),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::RoutingStrategyGetResponse)
      end
      def create(
        # Human-readable name for the routing strategy.
        name:,
        # Routing tree defining channel selection method and order.
        routing:,
        # Per-channel delivery configuration. Defaults to empty if omitted.
        channels: nil,
        # Optional description of the routing strategy.
        description: nil,
        # Per-provider delivery configuration. Defaults to empty if omitted.
        providers: nil,
        # Optional tags for categorization.
        tags: nil,
        request_options: {}
      )
      end

      # Retrieve a routing strategy by ID. Returns the full entity including routing
      # content and metadata.
      sig do
        params(
          id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::RoutingStrategyGetResponse)
      end
      def retrieve(
        # Routing strategy ID (rs\_ prefix).
        id,
        request_options: {}
      )
      end

      # List routing strategies in your workspace. Returns metadata only (no
      # routing/channels/providers content). Use GET /routing-strategies/{id} for full
      # details.
      sig do
        params(
          cursor: T.nilable(String),
          limit: Integer,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::RoutingStrategyListResponse)
      end
      def list(
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Maximum number of results per page. Default 20, max 100.
        limit: nil,
        request_options: {}
      )
      end

      # Archive a routing strategy. The strategy must not have associated notification
      # templates. Unlink all templates before archiving.
      sig do
        params(
          id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def archive(
        # Routing strategy ID (rs\_ prefix).
        id,
        request_options: {}
      )
      end

      # List notification templates associated with a routing strategy. Includes
      # template metadata only, not full content.
      sig do
        params(
          id: String,
          cursor: T.nilable(String),
          limit: Integer,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::AssociatedNotificationListResponse)
      end
      def list_notifications(
        # Routing strategy ID (`rs_` prefix).
        id,
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Maximum number of results per page. Default 20, max 100.
        limit: nil,
        request_options: {}
      )
      end

      # Replace a routing strategy. Full document replacement; the caller must send the
      # complete desired state. Missing optional fields are cleared.
      sig do
        params(
          id: String,
          name: String,
          routing: Courier::MessageRouting::OrHash,
          channels: T.nilable(T::Hash[Symbol, Courier::Channel::OrHash]),
          description: T.nilable(String),
          providers:
            T.nilable(T::Hash[Symbol, Courier::MessageProvidersType::OrHash]),
          tags: T.nilable(T::Array[String]),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::RoutingStrategyGetResponse)
      end
      def replace(
        # Routing strategy ID (rs\_ prefix).
        id,
        # Human-readable name for the routing strategy.
        name:,
        # Routing tree defining channel selection method and order.
        routing:,
        # Per-channel delivery configuration. Omit to clear.
        channels: nil,
        # Optional description. Omit or null to clear.
        description: nil,
        # Per-provider delivery configuration. Omit to clear.
        providers: nil,
        # Optional tags. Omit or null to clear.
        tags: nil,
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
