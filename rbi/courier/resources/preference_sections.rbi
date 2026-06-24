# typed: strong

module Courier
  module Resources
    class PreferenceSections
      sig { returns(Courier::Resources::PreferenceSections::Topics) }
      attr_reader :topics

      # Create a preference section in your workspace. The section id is generated and
      # returned. Topics are created inside a section via POST
      # /preferences/sections/{section_id}/topics.
      sig do
        params(
          name: String,
          has_custom_routing: T.nilable(T::Boolean),
          routing_options:
            T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::PreferenceSectionGetResponse)
      end
      def create(
        # Human-readable name for the section.
        name:,
        # Whether the section defines custom routing for its topics.
        has_custom_routing: nil,
        # Default channels for the section. Defaults to empty if omitted.
        routing_options: nil,
        request_options: {}
      )
      end

      # Retrieve a preference section by id, including its topics.
      sig do
        params(
          section_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::PreferenceSectionGetResponse)
      end
      def retrieve(
        # Id of the preference section.
        section_id,
        request_options: {}
      )
      end

      # List the workspace's preference sections. Each section embeds its topics. Scoped
      # to the workspace of the API key.
      sig do
        params(request_options: Courier::RequestOptions::OrHash).returns(
          Courier::PreferenceSectionListResponse
        )
      end
      def list(request_options: {})
      end

      # Archive a preference section. The section must be empty: delete its topics
      # first, otherwise the request fails with 409.
      sig do
        params(
          section_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def archive(
        # Id of the preference section.
        section_id,
        request_options: {}
      )
      end

      # Publish the workspace's preferences page. Takes a snapshot of every section with
      # its topics under a new published version, making the current state visible on
      # the hosted preferences page (non-draft).
      sig do
        params(request_options: Courier::RequestOptions::OrHash).returns(
          Courier::PublishPreferencesResponse
        )
      end
      def publish(request_options: {})
      end

      # Replace a preference section. Full document replacement; missing optional fields
      # are cleared. Topics attached to the section are unaffected.
      sig do
        params(
          section_id: String,
          name: String,
          has_custom_routing: T.nilable(T::Boolean),
          routing_options:
            T.nilable(T::Array[Courier::ChannelClassification::OrSymbol]),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::PreferenceSectionGetResponse)
      end
      def replace(
        # Id of the preference section.
        section_id,
        # Human-readable name for the section.
        name:,
        # Whether the section defines custom routing for its topics.
        has_custom_routing: nil,
        # Default channels for the section. Omit to clear.
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
