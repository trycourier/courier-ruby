# frozen_string_literal: true

module Courier
  module Resources
    class WorkspacePreferences
      # @return [Courier::Resources::WorkspacePreferences::Topics]
      attr_reader :topics

      # Create a workspace preference. The workspace preference id is generated and
      # returned. Topics are created inside a workspace preference via POST
      # /preferences/sections/{section_id}/topics.
      #
      # @overload create(name:, description: nil, has_custom_routing: nil, routing_options: nil, request_options: {})
      #
      # @param name [String] Human-readable name for the workspace preference.
      #
      # @param description [String, nil] Optional description shown under the section on the hosted preferences page.
      #
      # @param has_custom_routing [Boolean, nil] Whether the workspace preference defines custom routing for its topics.
      #
      # @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels for the workspace preference. Defaults to empty if omitted.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::WorkspacePreferenceGetResponse]
      #
      # @see Courier::Models::WorkspacePreferenceCreateParams
      def create(params)
        parsed, options = Courier::WorkspacePreferenceCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "preferences/sections",
          body: parsed,
          model: Courier::WorkspacePreferenceGetResponse,
          options: options
        )
      end

      # Retrieve a workspace preference by id, including its topics.
      #
      # @overload retrieve(section_id, request_options: {})
      #
      # @param section_id [String] Id of the workspace preference.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::WorkspacePreferenceGetResponse]
      #
      # @see Courier::Models::WorkspacePreferenceRetrieveParams
      def retrieve(section_id, params = {})
        @client.request(
          method: :get,
          path: ["preferences/sections/%1$s", section_id],
          model: Courier::WorkspacePreferenceGetResponse,
          options: params[:request_options]
        )
      end

      # List the workspace's preferences. Each workspace preference embeds its topics.
      # Scoped to the workspace of the API key.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::WorkspacePreferenceListResponse]
      #
      # @see Courier::Models::WorkspacePreferenceListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "preferences/sections",
          model: Courier::WorkspacePreferenceListResponse,
          options: params[:request_options]
        )
      end

      # Archive a workspace preference. The workspace preference must be empty: delete
      # its topics first, otherwise the request fails with 409.
      #
      # @overload archive(section_id, request_options: {})
      #
      # @param section_id [String] Id of the workspace preference.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::WorkspacePreferenceArchiveParams
      def archive(section_id, params = {})
        @client.request(
          method: :delete,
          path: ["preferences/sections/%1$s", section_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::WorkspacePreferencePublishParams} for more details.
      #
      # Publish the workspace's preferences page. Takes a snapshot of every workspace
      # preference with its topics under a new published version, making the current
      # state visible on the hosted preferences page (non-draft).
      #
      # @overload publish(brand_id: nil, description: nil, heading: nil, request_options: {})
      #
      # @param brand_id [String, nil] Brand for the hosted page - "default" (workspace default brand), "none" (no bran
      #
      # @param description [String, nil] Description shown under the heading on the hosted preferences page.
      #
      # @param heading [String, nil] Heading shown at the top of the hosted preferences page.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::PublishPreferencesResponse]
      #
      # @see Courier::Models::WorkspacePreferencePublishParams
      def publish(params = {})
        parsed, options = Courier::WorkspacePreferencePublishParams.dump_request(params)
        @client.request(
          method: :post,
          path: "preferences/publish",
          body: parsed,
          model: Courier::PublishPreferencesResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::WorkspacePreferenceReplaceParams} for more details.
      #
      # Replace a workspace preference. Full document replacement; missing optional
      # fields are cleared. Topics attached to the workspace preference are unaffected.
      #
      # @overload replace(section_id, name:, description: nil, has_custom_routing: nil, routing_options: nil, request_options: {})
      #
      # @param section_id [String] Id of the workspace preference.
      #
      # @param name [String] Human-readable name for the workspace preference.
      #
      # @param description [String, nil] Optional description shown under the section on the hosted preferences page. Omi
      #
      # @param has_custom_routing [Boolean, nil] Whether the workspace preference defines custom routing for its topics.
      #
      # @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Default channels for the workspace preference. Omit to clear.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::WorkspacePreferenceGetResponse]
      #
      # @see Courier::Models::WorkspacePreferenceReplaceParams
      def replace(section_id, params)
        parsed, options = Courier::WorkspacePreferenceReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["preferences/sections/%1$s", section_id],
          body: parsed,
          model: Courier::WorkspacePreferenceGetResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @topics = Courier::Resources::WorkspacePreferences::Topics.new(client: client)
      end
    end
  end
end
