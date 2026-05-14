# typed: strong

module Courier
  module Resources
    class Journeys
      class Templates
        # Create a notification template scoped to this journey. The template is created
        # in DRAFT state.
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
          # Journey template id
          notification_id,
          # Journey id
          template_id:,
          request_options: {}
        )
        end

        # List notification templates scoped to this journey. Templates scoped to a
        # journey can only be referenced from `send` nodes of the same journey.
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
          cursor: nil,
          limit: nil,
          request_options: {}
        )
        end

        # Archive a journey-scoped notification template. Archived templates cannot be
        # sent.
        sig do
          params(
            notification_id: String,
            template_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def archive(
          # Journey template id
          notification_id,
          # Journey id
          template_id:,
          request_options: {}
        )
        end

        # List published versions of a journey-scoped notification template, ordered most
        # recent first.
        sig do
          params(
            notification_id: String,
            template_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::NotificationTemplateVersionListResponse)
        end
        def list_versions(
          # Journey template id
          notification_id,
          # Journey id
          template_id:,
          request_options: {}
        )
        end

        # Publish the current draft of a journey-scoped notification template.
        sig do
          params(
            notification_id: String,
            template_id: String,
            version: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def publish(
          # Path param: Journey template id
          notification_id,
          # Path param: Journey id
          template_id:,
          # Body param
          version: nil,
          request_options: {}
        )
        end

        # Replace a journey-scoped notification template draft.
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
          # Path param: Journey template id
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

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
