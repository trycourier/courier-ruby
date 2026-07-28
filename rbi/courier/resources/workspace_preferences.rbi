# typed: strong

module Courier
  module Resources
    class WorkspacePreferences
      sig { returns(Courier::Resources::WorkspacePreferences::Topics) }
      attr_reader :topics

      # Creates a workspace preference and returns its generated id. Add subscription
      # topics to it afterwards with the topics endpoint.
      sig do
        params(
          name: String,
          description: T.nilable(String),
          has_custom_routing: T.nilable(T::Boolean),
          routing_options:
            T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::WorkspacePreferenceGetResponse)
      end
      def create(
        # Body param: Human-readable name for the workspace preference.
        name:,
        # Body param: Optional description shown under the section on the hosted
        # preferences page.
        description: nil,
        # Body param: Whether the workspace preference defines custom routing for its
        # topics.
        has_custom_routing: nil,
        # Body param: Default channels for the workspace preference. Defaults to empty if
        # omitted.
        routing_options: nil,
        # Header param: A unique key that makes this request idempotent. If Courier
        # receives another request with the same `Idempotency-Key`, it returns the stored
        # response from the first request without performing the operation again
        # (including the original status code and any error). Use it to safely retry
        # `POST` requests after network failures without risking duplicate sends. The key
        # is scoped to this endpoint.
        idempotency_key: nil,
        # Header param: How long the idempotency key remains valid, as a Unix epoch
        # timestamp in seconds or an ISO 8601 date string. Only applies when
        # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
        # maximum is 1 year.
        x_idempotency_expiration: nil,
        request_options: {}
      )
      end

      # Returns one workspace preference by id, including its subscription topics,
      # routing options, and custom routing flag.
      sig do
        params(
          section_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::WorkspacePreferenceGetResponse)
      end
      def retrieve(
        # Id of the workspace preference.
        section_id,
        request_options: {}
      )
      end

      # Returns the workspace's preferences, each embedding its subscription topics,
      # routing options, and whether custom routing is allowed.
      sig do
        params(request_options: Courier::RequestOptions::OrHash).returns(
          Courier::WorkspacePreferenceListResponse
        )
      end
      def list(request_options: {})
      end

      # Archive a workspace preference. The workspace preference must be empty: delete
      # its topics first, otherwise the request fails with 409.
      sig do
        params(
          section_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def archive(
        # Id of the workspace preference.
        section_id,
        request_options: {}
      )
      end

      # Publishes the workspace preference page, snapshotting every preference and
      # topic, and returns the page id and a preview URL.
      sig do
        params(
          brand_id: T.nilable(String),
          description: T.nilable(String),
          heading: T.nilable(String),
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::PublishPreferencesResponse)
      end
      def publish(
        # Body param: Brand for the hosted page - "default" (workspace default brand),
        # "none" (no brand), or a specific brand id. Defaults to "default".
        brand_id: nil,
        # Body param: Description shown under the heading on the hosted preferences page.
        description: nil,
        # Body param: Heading shown at the top of the hosted preferences page.
        heading: nil,
        # Header param: A unique key that makes this request idempotent. If Courier
        # receives another request with the same `Idempotency-Key`, it returns the stored
        # response from the first request without performing the operation again
        # (including the original status code and any error). Use it to safely retry
        # `POST` requests after network failures without risking duplicate sends. The key
        # is scoped to this endpoint.
        idempotency_key: nil,
        # Header param: How long the idempotency key remains valid, as a Unix epoch
        # timestamp in seconds or an ISO 8601 date string. Only applies when
        # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
        # maximum is 1 year.
        x_idempotency_expiration: nil,
        request_options: {}
      )
      end

      # Replace a workspace preference. Full document replacement; missing optional
      # fields are cleared. Topics attached to the workspace preference are unaffected.
      sig do
        params(
          section_id: String,
          name: String,
          description: T.nilable(String),
          has_custom_routing: T.nilable(T::Boolean),
          routing_options:
            T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::WorkspacePreferenceGetResponse)
      end
      def replace(
        # Id of the workspace preference.
        section_id,
        # Human-readable name for the workspace preference.
        name:,
        # Optional description shown under the section on the hosted preferences page.
        # Omit to clear.
        description: nil,
        # Whether the workspace preference defines custom routing for its topics.
        has_custom_routing: nil,
        # Default channels for the workspace preference. Omit to clear.
        routing_options: nil,
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
