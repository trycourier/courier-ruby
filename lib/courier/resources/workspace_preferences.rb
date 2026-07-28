# frozen_string_literal: true

module Courier
  module Resources
    class WorkspacePreferences
      # @return [Courier::Resources::WorkspacePreferences::Topics]
      attr_reader :topics

      # Some parameter documentations has been truncated, see
      # {Courier::Models::WorkspacePreferenceCreateParams} for more details.
      #
      # Creates a workspace preference and returns its generated id. Add subscription
      # topics to it afterwards with the topics endpoint.
      #
      # @overload create(name:, description: nil, has_custom_routing: nil, routing_options: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param name [String] Body param: Human-readable name for the workspace preference.
      #
      # @param description [String, nil] Body param: Optional description shown under the section on the hosted preferenc
      #
      # @param has_custom_routing [Boolean, nil] Body param: Whether the workspace preference defines custom routing for its topi
      #
      # @param routing_options [Array<Symbol, Courier::Models::ChannelClassification>, nil] Body param: Default channels for the workspace preference. Defaults to empty if
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::WorkspacePreferenceGetResponse]
      #
      # @see Courier::Models::WorkspacePreferenceCreateParams
      def create(params)
        parsed, options = Courier::WorkspacePreferenceCreateParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: "preferences/sections",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Courier::WorkspacePreferenceGetResponse,
          options: options
        )
      end

      # Returns one workspace preference by id, including its subscription topics,
      # routing options, and custom routing flag.
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

      # Returns the workspace's preferences, each embedding its subscription topics,
      # routing options, and whether custom routing is allowed.
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
      # Publishes the workspace preference page, snapshotting every preference and
      # topic, and returns the page id and a preview URL.
      #
      # @overload publish(brand_id: nil, description: nil, heading: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param brand_id [String, nil] Body param: Brand for the hosted page - "default" (workspace default brand), "no
      #
      # @param description [String, nil] Body param: Description shown under the heading on the hosted preferences page.
      #
      # @param heading [String, nil] Body param: Heading shown at the top of the hosted preferences page.
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::PublishPreferencesResponse]
      #
      # @see Courier::Models::WorkspacePreferencePublishParams
      def publish(params = {})
        parsed, options = Courier::WorkspacePreferencePublishParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: "preferences/publish",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
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
