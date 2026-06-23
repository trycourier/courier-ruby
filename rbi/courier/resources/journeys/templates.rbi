# typed: strong

module Courier
  module Resources
    class Journeys
      class Templates
        # Create a notification template scoped to this journey. Defaults to `DRAFT`
        # state; pass `state: "PUBLISHED"` to publish on create.
        sig do
          params(
            template_id: String,
            channel: String,
            notification:
              Courier::JourneyTemplateCreateRequest::Notification::OrHash,
            provider_key: String,
            state: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::JourneyTemplateGetResponse)
        end
        def create(
          # Journey id
          template_id,
          channel:,
          notification:,
          provider_key: nil,
          state: nil,
          request_options: {}
        )
        end

        # Fetch a journey-scoped notification template by id. Pass `?version=draft`
        # (default `published`) to retrieve the working draft, or `?version=vN` for a
        # historical version.
        sig do
          params(
            notification_id: String,
            template_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::JourneyTemplateGetResponse)
        end
        def retrieve(
          # Notification template id
          notification_id,
          # Journey id
          template_id:,
          request_options: {}
        )
        end

        # List notification templates scoped to this journey. Journey-scoped notification
        # templates can only be referenced from `send` nodes within the same journey.
        sig do
          params(
            template_id: String,
            cursor: String,
            limit: Integer,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::JourneyTemplateListResponse)
        end
        def list(
          # Journey id
          template_id,
          # Pagination cursor from a prior response.
          cursor: nil,
          # Page size. Minimum 1, maximum 100.
          limit: nil,
          request_options: {}
        )
        end

        # Archive the journey-scoped notification template. Archived templates cannot be
        # sent.
        sig do
          params(
            notification_id: String,
            template_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def archive(
          # Notification template id
          notification_id,
          # Journey id
          template_id:,
          request_options: {}
        )
        end

        # List published versions of the journey-scoped notification template, ordered
        # most recent first.
        sig do
          params(
            notification_id: String,
            template_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::NotificationTemplateVersionListResponse)
        end
        def list_versions(
          # Notification template id
          notification_id,
          # Journey id
          template_id:,
          request_options: {}
        )
        end

        # Publish the current draft of the journey-scoped notification template as a new
        # version. Optionally roll back to a prior version by passing
        # `{ "version": "vN" }`.
        sig do
          params(
            notification_id: String,
            template_id: String,
            version: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def publish(
          # Path param: Notification template id
          notification_id,
          # Path param: Journey id
          template_id:,
          # Body param
          version: nil,
          request_options: {}
        )
        end

        # Replace the elemental content of a journey-scoped notification template.
        # Overwrites all elements in the template draft with the provided content.
        sig do
          params(
            notification_id: String,
            template_id: String,
            content: Courier::NotificationContentPutRequest::Content::OrHash,
            state: Courier::NotificationTemplateState::OrSymbol,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::NotificationContentMutationResponse)
        end
        def put_content(
          # Path param: Notification template id
          notification_id,
          # Path param: Journey id
          template_id:,
          # Body param: Elemental content payload. The server defaults `version` when
          # omitted.
          content:,
          # Body param: Template state. Defaults to `DRAFT`.
          state: nil,
          request_options: {}
        )
        end

        # Set locale-specific content overrides for a journey-scoped notification
        # template. Each element override must reference an existing element by ID.
        sig do
          params(
            locale_id: String,
            template_id: String,
            notification_id: String,
            elements:
              T::Array[Courier::NotificationLocalePutRequest::Element::OrHash],
            state: Courier::NotificationTemplateState::OrSymbol,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::NotificationContentMutationResponse)
        end
        def put_locale(
          # Path param: Locale code (e.g., `es`, `fr`, `pt-BR`).
          locale_id,
          # Path param: Journey id
          template_id:,
          # Path param: Notification template id
          notification_id:,
          # Body param: Elements with locale-specific content overrides.
          elements:,
          # Body param: Template state. Defaults to `DRAFT`.
          state: nil,
          request_options: {}
        )
        end

        # Replace the journey-scoped notification template draft.
        sig do
          params(
            notification_id: String,
            template_id: String,
            notification:
              Courier::JourneyTemplateReplaceRequest::Notification::OrHash,
            state: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::JourneyTemplateGetResponse)
        end
        def replace(
          # Path param: Notification template id
          notification_id,
          # Path param: Journey id
          template_id:,
          # Body param
          notification:,
          # Body param
          state: nil,
          request_options: {}
        )
        end

        # Retrieve the elemental content of a journey-scoped notification template. The
        # response contains the versioned elements along with their content checksums,
        # which can be used to detect changes between versions. Pass `?version=draft`
        # (default `published`) to retrieve the working draft, or `?version=vN` for a
        # historical version.
        sig do
          params(
            notification_id: String,
            template_id: String,
            version: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::NotificationContentGetResponse)
        end
        def retrieve_content(
          # Path param: Notification template id
          notification_id,
          # Path param: Journey id
          template_id:,
          # Query param: Accepts `draft`, `published`, or a version string (e.g., `v001`).
          # Defaults to `published`.
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
end
