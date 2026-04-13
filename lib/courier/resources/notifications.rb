# frozen_string_literal: true

module Courier
  module Resources
    class Notifications
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
      # @return [Courier::Models::NotificationTemplateGetResponse]
      #
      # @see Courier::Models::NotificationCreateParams
      def create(params)
        parsed, options = Courier::NotificationCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "notifications",
          body: parsed,
          model: Courier::NotificationTemplateGetResponse,
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

      # List versions of a notification template.
      #
      # @overload list_versions(id, cursor: nil, limit: nil, request_options: {})
      #
      # @param id [String] Template ID (nt\_ prefix).
      #
      # @param cursor [String] Opaque pagination cursor from a previous response. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of versions to return per page. Default 10, max 10.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationTemplateVersionListResponse]
      #
      # @see Courier::Models::NotificationListVersionsParams
      def list_versions(id, params = {})
        parsed, options = Courier::NotificationListVersionsParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["notifications/%1$s/versions", id],
          query: query,
          model: Courier::NotificationTemplateVersionListResponse,
          options: options
        )
      end

      # Publish a notification template. Publishes the current draft by default. Pass a
      # version in the request body to publish a specific historical version.
      #
      # @overload publish(id, version: nil, request_options: {})
      #
      # @param id [String] Template ID (nt\_ prefix).
      #
      # @param version [String] Historical version to publish (e.g. "v001"). Omit to publish the current draft.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::NotificationPublishParams
      def publish(id, params = {})
        parsed, options = Courier::NotificationPublishParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["notifications/%1$s/publish", id],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Replace the elemental content of a notification template. Overwrites all
      # elements in the template with the provided content. Only supported for V2
      # (elemental) templates.
      #
      # @overload put_content(id, content:, state: nil, request_options: {})
      #
      # @param id [String] Notification template ID (`nt_` prefix).
      #
      # @param content [Courier::Models::NotificationContentPutRequest::Content] Elemental content payload. The server defaults `version` when omitted.
      #
      # @param state [Symbol, Courier::Models::NotificationTemplateState] Template state. Defaults to `DRAFT`.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationContentMutationResponse]
      #
      # @see Courier::Models::NotificationPutContentParams
      def put_content(id, params)
        parsed, options = Courier::NotificationPutContentParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["notifications/%1$s/content", id],
          body: parsed,
          model: Courier::NotificationContentMutationResponse,
          options: options
        )
      end

      # Update a single element within a notification template. Only supported for V2
      # (elemental) templates.
      #
      # @overload put_element(element_id, id:, type:, channels: nil, data: nil, if_: nil, loop_: nil, ref: nil, state: nil, request_options: {})
      #
      # @param element_id [String] Path param: Element ID within the template.
      #
      # @param id [String] Path param: Notification template ID (`nt_` prefix).
      #
      # @param type [String] Body param: Element type (text, meta, action, image, etc.).
      #
      # @param channels [Array<String>] Body param
      #
      # @param data [Hash{Symbol=>Object}] Body param
      #
      # @param if_ [String] Body param
      #
      # @param loop_ [String] Body param
      #
      # @param ref [String] Body param
      #
      # @param state [Symbol, Courier::Models::NotificationTemplateState] Body param: Template state. Defaults to `DRAFT`.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationContentMutationResponse]
      #
      # @see Courier::Models::NotificationPutElementParams
      def put_element(element_id, params)
        parsed, options = Courier::NotificationPutElementParams.dump_request(params)
        id =
          parsed.delete(:id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :put,
          path: ["notifications/%1$s/elements/%2$s", id, element_id],
          body: parsed,
          model: Courier::NotificationContentMutationResponse,
          options: options
        )
      end

      # Set locale-specific content overrides for a notification template. Each element
      # override must reference an existing element by ID. Only supported for V2
      # (elemental) templates.
      #
      # @overload put_locale(locale_id, id:, elements:, state: nil, request_options: {})
      #
      # @param locale_id [String] Path param: Locale code (e.g., `es`, `fr`, `pt-BR`).
      #
      # @param id [String] Path param: Notification template ID (`nt_` prefix).
      #
      # @param elements [Array<Courier::Models::NotificationLocalePutRequest::Element>] Body param: Elements with locale-specific content overrides.
      #
      # @param state [Symbol, Courier::Models::NotificationTemplateState] Body param: Template state. Defaults to `DRAFT`.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationContentMutationResponse]
      #
      # @see Courier::Models::NotificationPutLocaleParams
      def put_locale(locale_id, params)
        parsed, options = Courier::NotificationPutLocaleParams.dump_request(params)
        id =
          parsed.delete(:id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :put,
          path: ["notifications/%1$s/locales/%2$s", id, locale_id],
          body: parsed,
          model: Courier::NotificationContentMutationResponse,
          options: options
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
      # @return [Courier::Models::NotificationTemplateGetResponse]
      #
      # @see Courier::Models::NotificationReplaceParams
      def replace(id, params)
        parsed, options = Courier::NotificationReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["notifications/%1$s", id],
          body: parsed,
          model: Courier::NotificationTemplateGetResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::NotificationRetrieveContentParams} for more details.
      #
      # Retrieve the content of a notification template. The response shape depends on
      # whether the template uses V1 (blocks/channels) or V2 (elemental) content. Use
      # the `version` query parameter to select draft, published, or a specific
      # historical version.
      #
      # @overload retrieve_content(id, version: nil, request_options: {})
      #
      # @param id [String] Notification template ID (`nt_` prefix).
      #
      # @param version [String] Accepts `draft`, `published`, or a version string (e.g., `v001`). Defaults to `p
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationContentGetResponse, Courier::Models::NotificationGetContent]
      #
      # @see Courier::Models::NotificationRetrieveContentParams
      def retrieve_content(id, params = {})
        parsed, options = Courier::NotificationRetrieveContentParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["notifications/%1$s/content", id],
          query: query,
          model: Courier::Models::NotificationRetrieveContentResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @checks = Courier::Resources::Notifications::Checks.new(client: client)
      end
    end
  end
end
