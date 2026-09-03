# frozen_string_literal: true

module Courier
  module Resources
    # Create, update, version, publish, and localize notification templates and their
    # content.
    class Notifications
      # Create, update, version, publish, and localize notification templates and their
      # content.
      # @return [Courier::Resources::Notifications::Checks]
      attr_reader :checks

      # Some parameter documentations has been truncated, see
      # {Courier::Models::NotificationCreateParams} for more details.
      #
      # Create a notification template. Requires all fields in the notification object.
      # Templates are created in draft state by default.
      #
      # Content must place its elements inside a channel block —
      # `{ "type": "channel", "channel": "email", "elements": [...] }` — or the request
      # returns `400`. The template designer renders only the channel block matching the
      # tab it draws, so content stored without one cannot be opened. An empty
      # `elements` array is accepted, and the requirement applies to creation only:
      # `PUT /notifications/{id}` still accepts unwrapped content. Note this endpoint
      # takes versioned content only — the `{ title, body }` shorthand accepted by
      # `/send` is rejected here with an `invalid_request_error` on
      # `notification.content.version`.
      #
      # @overload create(notification:, state: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param notification [Courier::Models::NotificationTemplateWritePayload] Body param: Template fields accepted in POST and PUT request bodies, nested unde
      #
      # @param state [Symbol, Courier::Models::NotificationTemplateCreateRequest::State] Body param: Template state after creation. Case-insensitive input, normalized to
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationTemplateResponse]
      #
      # @see Courier::Models::NotificationCreateParams
      def create(params)
        parsed, options = Courier::NotificationCreateParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: "notifications",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Courier::NotificationTemplateResponse,
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
      # @return [Courier::Models::NotificationTemplateResponse]
      #
      # @see Courier::Models::NotificationRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Courier::NotificationRetrieveParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["notifications/%1$s", id],
          query: query,
          model: Courier::NotificationTemplateResponse,
          options: options
        )
      end

      # Lists the workspace's notification templates. Each carries a name, tags, brand,
      # routing, and its draft or published state.
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

      # Archives a notification template, preventing new sends from referencing it. The
      # template stays retrievable for its version history.
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

      # Some parameter documentations has been truncated, see
      # {Courier::Models::NotificationGetMetricsParams} for more details.
      #
      # Fetch the delivery funnel for one Notification Template as a time series — sent,
      # delivered, opened, clicked, errors, and undeliverable — broken out per provider
      # and channel inside each bucket. Sum the entries in a bucket for its totals;
      # there is no bucket-level total.
      #
      # Choose the window absolutely with `start` and `end`, or relatively with
      # `lookback` (an ISO 8601 duration). `start` and `end` take precedence when both
      # are supplied, and a request carrying neither defaults to `lookback=P30D`. The
      # window is snapped outwards onto the `granularity` grid so every bucket it
      # overlaps is returned whole, and the snapped boundaries come back as `start` and
      # `end` — align a chart on those rather than on what was requested. Every boundary
      # is UTC; there is no timezone support.
      #
      # Every bucket in the window is returned, including the quiet ones, whose `data`
      # array is empty, so a series is directly plottable with no gap filling
      # client-side. An unknown template id returns `200` with an all-empty series
      # rather than `404`, and messages sent without a Notification Template never
      # appear here.
      #
      # Available in the US region only.
      #
      # @overload get_metrics(id, end_: nil, granularity: nil, lookback: nil, start: nil, request_options: {})
      #
      # @param id [String] The Notification Template to report on — its ID (`nt_` prefix) or an alias. Must
      #
      # @param end_ [Time] The end of the window, as an ISO 8601 timestamp with an offset. Must be supplied
      #
      # @param granularity [Symbol, Courier::Models::NotificationGetMetricsParams::Granularity] The size of each bucket in the series. Defaults to `DAY`. `WEEK` buckets start o
      #
      # @param lookback [String] The length of the window, counted back from now, as an ISO 8601 duration (`P30D`
      #
      # @param start [Time] The inclusive start of the window, as an ISO 8601 timestamp with an offset (`202
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationMetricsResponse]
      #
      # @see Courier::Models::NotificationGetMetricsParams
      def get_metrics(id, params = {})
        parsed, options = Courier::NotificationGetMetricsParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["notifications/%1$s/metrics", id],
          query: query.transform_keys(end_: "end"),
          model: Courier::NotificationMetricsResponse,
          options: options
        )
      end

      # Returns a notification template's published versions, most recent first, for
      # comparison or rollback. Paged.
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

      # Some parameter documentations has been truncated, see
      # {Courier::Models::NotificationPublishParams} for more details.
      #
      # Publish a notification template. Publishes the current draft by default. Pass a
      # version in the request body to publish a specific historical version.
      #
      # @overload publish(id, version: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param id [String] Path param: Template ID (nt\_ prefix).
      #
      # @param version [String] Body param: Historical version to publish (e.g. "v001"). Omit to publish the cur
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::NotificationPublishParams
      def publish(id, params = {})
        parsed, options = Courier::NotificationPublishParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: ["notifications/%1$s/publish", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: NilClass,
          options: options
        )
      end

      # Replaces all Elemental content in a template, overwriting every existing
      # element. Supported for V2 templates only, not V1 blocks and channels.
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

      # Replaces one Elemental element in a template, addressed by its element id.
      # Supported for V2 templates only, not V1 blocks and channels.
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

      # Sets locale-specific content overrides for a template. Each override must
      # reference an element that already exists in the default content.
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
      # Replaces a notification template in full, so send every field rather than only
      # the ones you want changed. Publish separately to make it live.
      #
      # @overload replace(id, notification:, state: nil, request_options: {})
      #
      # @param id [String] Template ID (nt\_ prefix).
      #
      # @param notification [Courier::Models::NotificationTemplateWritePayload] Template fields accepted in POST and PUT request bodies, nested under a `notific
      #
      # @param state [Symbol, Courier::Models::NotificationTemplateUpdateRequest::State] Template state after update. Case-insensitive input, normalized to uppercase in
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::NotificationTemplateResponse]
      #
      # @see Courier::Models::NotificationReplaceParams
      def replace(id, params)
        parsed, options = Courier::NotificationReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["notifications/%1$s", id],
          body: parsed,
          model: Courier::NotificationTemplateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::NotificationRetrieveContentParams} for more details.
      #
      # Returns a template's content and checksum. V2 templates return Elemental
      # elements, while V1 templates return blocks and channels instead.
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
