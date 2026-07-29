# typed: strong

module Courier
  module Resources
    # Create, update, version, publish, and localize notification templates and their
    # content.
    class Notifications
      # Create, update, version, publish, and localize notification templates and their
      # content.
      sig { returns(Courier::Resources::Notifications::Checks) }
      attr_reader :checks

      # Create a notification template. Requires all fields in the notification object.
      # Templates are created in draft state by default.
      sig do
        params(
          notification: Courier::NotificationTemplatePayload::OrHash,
          state: Courier::NotificationTemplateCreateRequest::State::OrSymbol,
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateResponse)
      end
      def create(
        # Body param: Core template fields used in POST and PUT request bodies (nested
        # under a `notification` key) and returned at the top level in responses.
        notification:,
        # Body param: Template state after creation. Case-insensitive input, normalized to
        # uppercase in the response. Defaults to "DRAFT".
        state: nil,
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

      # Retrieve a notification template by ID. Returns the published version by
      # default. Pass version=draft to retrieve an unpublished template.
      sig do
        params(
          id: String,
          version: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateResponse)
      end
      def retrieve(
        # Template ID (nt\_ prefix).
        id,
        # Version to retrieve. One of "draft", "published", or a version string like
        # "v001". Defaults to "published".
        version: nil,
        request_options: {}
      )
      end

      # Lists the workspace's notification templates. Each carries a name, tags, brand,
      # routing, and its draft or published state.
      sig do
        params(
          cursor: T.nilable(String),
          event_id: String,
          notes: T.nilable(T::Boolean),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::NotificationListResponse)
      end
      def list(
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Filter to templates linked to this event map ID.
        event_id: nil,
        # Include template notes in the response. Only applies to legacy templates.
        notes: nil,
        request_options: {}
      )
      end

      # Archives a notification template, preventing new sends from referencing it. The
      # template stays retrievable for its version history.
      sig do
        params(
          id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def archive(
        # Template ID (nt\_ prefix).
        id,
        request_options: {}
      )
      end

      # Copies a notification template within the same workspace and environment,
      # appending " COPY" to the title. The copy is standalone and independently
      # editable.
      sig do
        params(
          id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateResponse)
      end
      def duplicate(
        # Template ID (nt\_ prefix).
        id,
        request_options: {}
      )
      end

      # Returns a notification template's published versions, most recent first, for
      # comparison or rollback. Paged.
      sig do
        params(
          id: String,
          cursor: String,
          limit: Integer,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateVersionListResponse)
      end
      def list_versions(
        # Template ID (nt\_ prefix).
        id,
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Maximum number of versions to return per page. Default 10, max 10.
        limit: nil,
        request_options: {}
      )
      end

      # Publish a notification template. Publishes the current draft by default. Pass a
      # version in the request body to publish a specific historical version.
      sig do
        params(
          id: String,
          version: String,
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def publish(
        # Path param: Template ID (nt\_ prefix).
        id,
        # Body param: Historical version to publish (e.g. "v001"). Omit to publish the
        # current draft.
        version: nil,
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

      # Replaces all Elemental content in a template, overwriting every existing
      # element. Supported for V2 templates only, not V1 blocks and channels.
      sig do
        params(
          id: String,
          content: Courier::NotificationContentPutRequest::Content::OrHash,
          state: Courier::NotificationTemplateState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationContentMutationResponse)
      end
      def put_content(
        # Notification template ID (`nt_` prefix).
        id,
        # Elemental content payload. The server defaults `version` when omitted.
        content:,
        # Template state. Defaults to `DRAFT`.
        state: nil,
        request_options: {}
      )
      end

      # Replaces one Elemental element in a template, addressed by its element id.
      # Supported for V2 templates only, not V1 blocks and channels.
      sig do
        params(
          element_id: String,
          id: String,
          type: String,
          channels: T::Array[String],
          data: T::Hash[Symbol, T.anything],
          if_: String,
          loop_: String,
          ref: String,
          state: Courier::NotificationTemplateState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationContentMutationResponse)
      end
      def put_element(
        # Path param: Element ID within the template.
        element_id,
        # Path param: Notification template ID (`nt_` prefix).
        id:,
        # Body param: Element type (text, meta, action, image, etc.).
        type:,
        # Body param
        channels: nil,
        # Body param
        data: nil,
        # Body param
        if_: nil,
        # Body param
        loop_: nil,
        # Body param
        ref: nil,
        # Body param: Template state. Defaults to `DRAFT`.
        state: nil,
        request_options: {}
      )
      end

      # Sets locale-specific content overrides for a template. Each override must
      # reference an element that already exists in the default content.
      sig do
        params(
          locale_id: String,
          id: String,
          elements:
            T::Array[Courier::NotificationLocalePutRequest::Element::OrHash],
          state: Courier::NotificationTemplateState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationContentMutationResponse)
      end
      def put_locale(
        # Path param: Locale code (e.g., `es`, `fr`, `pt-BR`).
        locale_id,
        # Path param: Notification template ID (`nt_` prefix).
        id:,
        # Body param: Elements with locale-specific content overrides.
        elements:,
        # Body param: Template state. Defaults to `DRAFT`.
        state: nil,
        request_options: {}
      )
      end

      # Replaces a notification template in full, so send every field rather than only
      # the ones you want changed. Publish separately to make it live.
      sig do
        params(
          id: String,
          notification: Courier::NotificationTemplatePayload::OrHash,
          state: Courier::NotificationTemplateUpdateRequest::State::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateResponse)
      end
      def replace(
        # Template ID (nt\_ prefix).
        id,
        # Core template fields used in POST and PUT request bodies (nested under a
        # `notification` key) and returned at the top level in responses.
        notification:,
        # Template state after update. Case-insensitive input, normalized to uppercase in
        # the response. Defaults to "DRAFT".
        state: nil,
        request_options: {}
      )
      end

      # Returns a template's content and checksum. V2 templates return Elemental
      # elements, while V1 templates return blocks and channels instead.
      sig do
        params(
          id: String,
          version: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(
          Courier::Models::NotificationRetrieveContentResponse::Variants
        )
      end
      def retrieve_content(
        # Notification template ID (`nt_` prefix).
        id,
        # Accepts `draft`, `published`, or a version string (e.g., `v001`). Defaults to
        # `published`.
        version: nil,
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
