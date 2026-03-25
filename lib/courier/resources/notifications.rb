# frozen_string_literal: true

module Courier
  module Resources
    class Notifications
      # @return [Courier::Resources::Notifications::Draft]
      attr_reader :draft

      # @return [Courier::Resources::Notifications::Checks]
      attr_reader :checks

      # Some parameter documentations has been truncated, see
      # {Courier::Models::NotificationCreateParams} for more details.
      #
      # Create a notification template. Requires all fields in the notification object.
      # Templates are created in draft state by default.
      #
      # @overload create(notification:, state: nil, request_options: {})
      #
      # @param notification [Courier::Models::NotificationTemplatePayload] Full document shape used in POST and PUT request bodies, and returned inside the
      #
      # @param state [Symbol, Courier::Models::NotificationTemplateCreateRequest::State] Template state after creation. Case-insensitive input, normalized to uppercase i
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationTemplateMutationResponse]
      #
      # @see Courier::Models::NotificationCreateParams
      def create(params)
        parsed, options = Courier::NotificationCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "notifications",
          body: parsed,
          model: Courier::NotificationTemplateMutationResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::NotificationRetrieveParams} for more details.
      #
      # Retrieve a notification template by ID. Returns the published version by
      # default. Pass version=draft to retrieve an unpublished template.
      #
      # @overload retrieve(id, version: nil, request_options: {})
      #
      # @param id [String] Template ID (nt\_ prefix).
      #
      # @param version [String] Version to retrieve. One of "draft", "published", or a version string like "v001
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationTemplateGetResponse]
      #
      # @see Courier::Models::NotificationRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Courier::NotificationRetrieveParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["notifications/%1$s", id],
          query: query,
          model: Courier::NotificationTemplateGetResponse,
          options: options
        )
      end

      # List notification templates in your workspace.
      #
      # @overload list(cursor: nil, event_id: nil, notes: nil, request_options: {})
      #
      # @param cursor [String, nil] Opaque pagination cursor from a previous response. Omit for the first page.
      #
      # @param event_id [String] Filter to templates linked to this event map ID.
      #
      # @param notes [Boolean, nil] Include template notes in the response. Only applies to legacy templates.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationListResponse]
      #
      # @see Courier::Models::NotificationListParams
      def list(params = {})
        parsed, options = Courier::NotificationListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "notifications",
          query: query,
          model: Courier::Models::NotificationListResponse,
          options: options
        )
      end

      # Archive a notification template.
      #
      # @overload archive(id, request_options: {})
      #
      # @param id [String] Template ID (nt\_ prefix).
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::NotificationArchiveParams
      def archive(id, params = {})
        @client.request(
          method: :delete,
          path: ["notifications/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Publish the current draft of a notification template.
      #
      # @overload publish(id, request_options: {})
      #
      # @param id [String] Template ID (nt\_ prefix).
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::NotificationPublishParams
      def publish(id, params = {})
        @client.request(
          method: :post,
          path: ["notifications/%1$s/publish", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::NotificationReplaceParams} for more details.
      #
      # Replace a notification template. All fields are required.
      #
      # @overload replace(id, notification:, state: nil, request_options: {})
      #
      # @param id [String] Template ID (nt\_ prefix).
      #
      # @param notification [Courier::Models::NotificationTemplatePayload] Full document shape used in POST and PUT request bodies, and returned inside the
      #
      # @param state [Symbol, Courier::Models::NotificationTemplateUpdateRequest::State] Template state after update. Case-insensitive input, normalized to uppercase in
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationTemplateMutationResponse]
      #
      # @see Courier::Models::NotificationReplaceParams
      def replace(id, params)
        parsed, options = Courier::NotificationReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["notifications/%1$s", id],
          body: parsed,
          model: Courier::NotificationTemplateMutationResponse,
          options: options
        )
      end

      # @overload retrieve_content(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationGetContent]
      #
      # @see Courier::Models::NotificationRetrieveContentParams
      def retrieve_content(id, params = {})
        @client.request(
          method: :get,
          path: ["notifications/%1$s/content", id],
          model: Courier::NotificationGetContent,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @draft = Courier::Resources::Notifications::Draft.new(client: client)
        @checks = Courier::Resources::Notifications::Checks.new(client: client)
      end
    end
  end
end
