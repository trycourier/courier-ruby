# frozen_string_literal: true

module Courier
  module Resources
    class PreferenceSections
      # @return [Courier::Resources::PreferenceSections::Topics]
      attr_reader :topics

      # Create a preference section in your workspace. The section id is generated and
      # returned. Topics are created inside a section via POST
      # /preferences/sections/{section_id}/topics.
      #
      # @overload create(name:, has_custom_routing: nil, routing_options: nil, request_options: {})
      #
      # @param name [String] Human-readable name for the section.
      #
      # @param has_custom_routing [Boolean, nil] Whether the section defines custom routing for its topics.
      #
      # @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels for the section. Defaults to empty if omitted.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::PreferenceSectionGetResponse]
      #
      # @see Courier::Models::PreferenceSectionCreateParams
      def create(params)
        parsed, options = Courier::PreferenceSectionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "preferences/sections",
          body: parsed,
          model: Courier::PreferenceSectionGetResponse,
          options: options
        )
      end

      # Retrieve a preference section by id, including its topics.
      #
      # @overload retrieve(section_id, request_options: {})
      #
      # @param section_id [String] Id of the preference section.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::PreferenceSectionGetResponse]
      #
      # @see Courier::Models::PreferenceSectionRetrieveParams
      def retrieve(section_id, params = {})
        @client.request(
          method: :get,
          path: ["preferences/sections/%1$s", section_id],
          model: Courier::PreferenceSectionGetResponse,
          options: params[:request_options]
        )
      end

      # List the workspace's preference sections. Each section embeds its topics. Scoped
      # to the workspace of the API key.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::PreferenceSectionListResponse]
      #
      # @see Courier::Models::PreferenceSectionListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "preferences/sections",
          model: Courier::PreferenceSectionListResponse,
          options: params[:request_options]
        )
      end

      # Archive a preference section. The section must be empty: delete its topics
      # first, otherwise the request fails with 409.
      #
      # @overload archive(section_id, request_options: {})
      #
      # @param section_id [String] Id of the preference section.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::PreferenceSectionArchiveParams
      def archive(section_id, params = {})
        @client.request(
          method: :delete,
          path: ["preferences/sections/%1$s", section_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Publish the workspace's preferences page. Takes a snapshot of every section with
      # its topics under a new published version, making the current state visible on
      # the hosted preferences page (non-draft).
      #
      # @overload publish(request_options: {})
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::PublishPreferencesResponse]
      #
      # @see Courier::Models::PreferenceSectionPublishParams
      def publish(params = {})
        @client.request(
          method: :post,
          path: "preferences/publish",
          model: Courier::PublishPreferencesResponse,
          options: params[:request_options]
        )
      end

      # Replace a preference section. Full document replacement; missing optional fields
      # are cleared. Topics attached to the section are unaffected.
      #
      # @overload replace(section_id, name:, has_custom_routing: nil, routing_options: nil, request_options: {})
      #
      # @param section_id [String] Id of the preference section.
      #
      # @param name [String] Human-readable name for the section.
      #
      # @param has_custom_routing [Boolean, nil] Whether the section defines custom routing for its topics.
      #
      # @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels for the section. Omit to clear.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::PreferenceSectionGetResponse]
      #
      # @see Courier::Models::PreferenceSectionReplaceParams
      def replace(section_id, params)
        parsed, options = Courier::PreferenceSectionReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["preferences/sections/%1$s", section_id],
          body: parsed,
          model: Courier::PreferenceSectionGetResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @topics = Courier::Resources::PreferenceSections::Topics.new(client: client)
      end
    end
  end
end
