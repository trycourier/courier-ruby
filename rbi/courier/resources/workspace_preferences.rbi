# typed: strong

module Courier
  module Resources
    class WorkspacePreferences
      sig { returns(Courier::Resources::WorkspacePreferences::Topics) }
      attr_reader :topics

      # Create a workspace preference. The workspace preference id is generated and
      # returned. Topics are created inside a workspace preference via POST
      # /preferences/sections/{section_id}/topics.
      sig do
        params(
          name: String,
          description: T.nilable(String),
          has_custom_routing: T.nilable(T::Boolean),
          routing_options:
            T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::WorkspacePreferenceGetResponse)
      end
      def create(
        # Human-readable name for the workspace preference.
        name:,
        # Optional description shown under the section on the hosted preferences page.
        description: nil,
        # Whether the workspace preference defines custom routing for its topics.
        has_custom_routing: nil,
        # Default channels for the workspace preference. Defaults to empty if omitted.
        routing_options: nil,
        request_options: {}
      )
      end

      # Retrieve a workspace preference by id, including its topics.
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

      # List the workspace's preferences. Each workspace preference embeds its topics.
      # Scoped to the workspace of the API key.
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

      # Publish the workspace's preferences page. Takes a snapshot of every workspace
      # preference with its topics under a new published version, making the current
      # state visible on the hosted preferences page (non-draft).
      sig do
        params(
          brand_id: T.nilable(String),
          description: T.nilable(String),
          heading: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::PublishPreferencesResponse)
      end
      def publish(
        # Brand for the hosted page - "default" (workspace default brand), "none" (no
        # brand), or a specific brand id. Defaults to "default".
        brand_id: nil,
        # Description shown under the heading on the hosted preferences page.
        description: nil,
        # Heading shown at the top of the hosted preferences page.
        heading: nil,
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
