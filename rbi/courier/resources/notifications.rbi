# typed: strong

module Courier
  module Resources
    class Notifications
      sig { returns(Courier::Resources::Notifications::Draft) }
      attr_reader :draft

      sig { returns(Courier::Resources::Notifications::Checks) }
      attr_reader :checks

      # Create a notification template. Requires all fields in the notification object.
      # Templates are created in draft state by default.
      sig do
        params(
          notification: Courier::NotificationTemplatePayload::OrHash,
          state: Courier::NotificationTemplateCreateRequest::State::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateMutationResponse)
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
        ).returns(Courier::NotificationTemplateGetResponse)
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

      # Replace a notification template. All fields are required.
      sig do
        params(
          id: String,
          notification: Courier::NotificationTemplatePayload::OrHash,
          state: Courier::NotificationTemplateUpdateRequest::State::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateMutationResponse)
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

      sig do
        params(
          id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationGetContent)
      end
      def retrieve_content(id, request_options: {})
      end

      # @api private
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
