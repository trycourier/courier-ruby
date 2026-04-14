# typed: strong

module Courier
  module Resources
    class Notifications
      sig { returns(Courier::Resources::Notifications::Checks) }
      attr_reader :checks

      # Create a notification template. Requires all fields in the notification object.
      # Templates are created in draft state by default.
      sig do
        params(
          notification: Courier::NotificationTemplatePayload::OrHash,
          state: Courier::NotificationTemplateCreateRequest::State::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateResponse)
      end
      def create(
        # Full document shape used in POST and PUT request bodies, and returned inside the
        # GET response envelope.
        notification:,
        # Template state after creation. Case-insensitive input, normalized to uppercase
        # in the response. Defaults to "DRAFT".
        state: nil,
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

      # List notification templates in your workspace.
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

      # Archive a notification template.
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

      # List versions of a notification template.
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
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def publish(
        # Template ID (nt\_ prefix).
        id,
        # Historical version to publish (e.g. "v001"). Omit to publish the current draft.
        version: nil,
        request_options: {}
      )
      end

      # Replace the elemental content of a notification template. Overwrites all
      # elements in the template with the provided content. Only supported for V2
      # (elemental) templates.
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

      # Update a single element within a notification template. Only supported for V2
      # (elemental) templates.
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

      # Set locale-specific content overrides for a notification template. Each element
      # override must reference an existing element by ID. Only supported for V2
      # (elemental) templates.
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

      # Replace a notification template. All fields are required.
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
        # Full document shape used in POST and PUT request bodies, and returned inside the
        # GET response envelope.
        notification:,
        # Template state after update. Case-insensitive input, normalized to uppercase in
        # the response. Defaults to "DRAFT".
        state: nil,
        request_options: {}
      )
      end

      # Retrieve the content of a notification template. The response shape depends on
      # whether the template uses V1 (blocks/channels) or V2 (elemental) content. Use
      # the `version` query parameter to select draft, published, or a specific
      # historical version.
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
