# typed: strong

module Courier
  module Resources
    # Create, update, version, publish, and localize notification templates and their
    # content.
    class Notifications
      # Create, update, version, publish, and localize notification templates and their
      # content.
      sig { returns(Courier::Resources::Notifications::Checks) }
      attr_reader :checks

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
      sig do
        params(
          notification: Courier::NotificationTemplateWritePayload::OrHash,
          state: Courier::NotificationTemplateCreateRequest::State::OrSymbol,
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateResponse)
      end
      def create(
        # Body param: Template fields accepted in POST and PUT request bodies, nested
        # under a `notification` key.
        notification:,
        # Body param: Template state after creation. Case-insensitive input, normalized to
        # uppercase in the response. Defaults to "DRAFT".
        state: nil,
        # Header param: A unique key that makes this request idempotent. If Courier
        # receives another request with the same `Idempotency-Key`, it returns the stored
        # response from the first request without performing the operation again
        # (including the original status code and any error). Use it to safely retry
        # `POST` requests after network failures without risking duplicate sends. The key
        # is scoped to this endpoint.
        idempotency_key: nil,
        # Header param: How long the idempotency key remains valid, as a Unix epoch
        # timestamp in seconds or an ISO 8601 date string. Only applies when
        # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
        # maximum is 1 year.
        x_idempotency_expiration: nil,
        request_options: {}
      )
      end

      # Retrieve a notification template by ID. Returns the published version by
      # default. Pass version=draft to retrieve an unpublished template.
      sig do
        params(
          id: String,
          version: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateResponse)
      end
      def retrieve(
        # Template ID (nt\_ prefix).
        id,
        # Version to retrieve. One of "draft", "published", or a version string like
        # "v001". Defaults to "published".
        version: nil,
        request_options: {}
      )
      end

      # Lists the workspace's notification templates. Each carries a name, tags, brand,
      # routing, and its draft or published state.
      sig do
        params(
          cursor: T.nilable(String),
          event_id: String,
          notes: T.nilable(T::Boolean),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::NotificationListResponse)
      end
      def list(
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Filter to templates linked to this event map ID.
        event_id: nil,
        # Include template notes in the response. Only applies to legacy templates.
        notes: nil,
        request_options: {}
      )
      end

      # Archives a notification template, preventing new sends from referencing it. The
      # template stays retrievable for its version history.
      sig do
        params(
          id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def archive(
        # Template ID (nt\_ prefix).
        id,
        request_options: {}
      )
      end

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
      sig do
        params(
          id: String,
          end_: Time,
          granularity:
            Courier::NotificationGetMetricsParams::Granularity::OrSymbol,
          lookback: String,
          start: Time,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationMetricsResponse)
      end
      def get_metrics(
        # The Notification Template to report on — its ID (`nt_` prefix) or an alias. Must
        # not contain commas or whitespace.
        id,
        # The end of the window, as an ISO 8601 timestamp with an offset. Must be supplied
        # together with `start`. An `end` in the future is accepted and not clamped — the
        # trailing buckets come back empty.
        end_: nil,
        # The size of each bucket in the series. Defaults to `DAY`. `WEEK` buckets start
        # on Sunday. A fine granularity caps the window it can cover: `HOUR` spans at most
        # 7 days and `DAY` at most 90 days, and a wider window returns `400` — request a
        # coarser granularity instead. `WEEK` and `MONTH` are uncapped, subject to the
        # 1000-bucket limit on a single response.
        granularity: nil,
        # The length of the window, counted back from now, as an ISO 8601 duration
        # (`P30D`, `P12W`, `PT12H`). Defaults to `P30D`, and is ignored when `start` and
        # `end` are supplied. A malformed or non-positive duration returns `400`.
        lookback: nil,
        # The inclusive start of the window, as an ISO 8601 timestamp with an offset
        # (`2026-04-01T00:00:00Z`). Must be supplied together with `end` and be earlier
        # than it; either one alone returns `400`.
        start: nil,
        request_options: {}
      )
      end

      # Returns a notification template's published versions, most recent first, for
      # comparison or rollback. Paged.
      sig do
        params(
          id: String,
          cursor: String,
          limit: Integer,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateVersionListResponse)
      end
      def list_versions(
        # Template ID (nt\_ prefix).
        id,
        # Opaque pagination cursor from a previous response. Omit for the first page.
        cursor: nil,
        # Maximum number of versions to return per page. Default 10, max 10.
        limit: nil,
        request_options: {}
      )
      end

      # Publish a notification template. Publishes the current draft by default. Pass a
      # version in the request body to publish a specific historical version.
      sig do
        params(
          id: String,
          version: String,
          idempotency_key: String,
          x_idempotency_expiration: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def publish(
        # Path param: Template ID (nt\_ prefix).
        id,
        # Body param: Historical version to publish (e.g. "v001"). Omit to publish the
        # current draft.
        version: nil,
        # Header param: A unique key that makes this request idempotent. If Courier
        # receives another request with the same `Idempotency-Key`, it returns the stored
        # response from the first request without performing the operation again
        # (including the original status code and any error). Use it to safely retry
        # `POST` requests after network failures without risking duplicate sends. The key
        # is scoped to this endpoint.
        idempotency_key: nil,
        # Header param: How long the idempotency key remains valid, as a Unix epoch
        # timestamp in seconds or an ISO 8601 date string. Only applies when
        # `Idempotency-Key` is provided. If omitted, the key is retained for 25 hours; the
        # maximum is 1 year.
        x_idempotency_expiration: nil,
        request_options: {}
      )
      end

      # Replaces all Elemental content in a template, overwriting every existing
      # element. Supported for V2 templates only, not V1 blocks and channels.
      sig do
        params(
          id: String,
          content: Courier::NotificationContentPutRequest::Content::OrHash,
          state: Courier::NotificationTemplateState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationContentMutationResponse)
      end
      def put_content(
        # Notification template ID (`nt_` prefix).
        id,
        # Elemental content payload. The server defaults `version` when omitted.
        content:,
        # Template state. Defaults to `DRAFT`.
        state: nil,
        request_options: {}
      )
      end

      # Replaces one Elemental element in a template, addressed by its element id.
      # Supported for V2 templates only, not V1 blocks and channels.
      sig do
        params(
          element_id: String,
          id: String,
          type: String,
          channels: T::Array[String],
          data: T::Hash[Symbol, T.anything],
          if_: String,
          loop_: String,
          ref: String,
          state: Courier::NotificationTemplateState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationContentMutationResponse)
      end
      def put_element(
        # Path param: Element ID within the template.
        element_id,
        # Path param: Notification template ID (`nt_` prefix).
        id:,
        # Body param: Element type (text, meta, action, image, etc.).
        type:,
        # Body param
        channels: nil,
        # Body param
        data: nil,
        # Body param
        if_: nil,
        # Body param
        loop_: nil,
        # Body param
        ref: nil,
        # Body param: Template state. Defaults to `DRAFT`.
        state: nil,
        request_options: {}
      )
      end

      # Sets locale-specific content overrides for a template. Each override must
      # reference an element that already exists in the default content.
      sig do
        params(
          locale_id: String,
          id: String,
          elements:
            T::Array[Courier::NotificationLocalePutRequest::Element::OrHash],
          state: Courier::NotificationTemplateState::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationContentMutationResponse)
      end
      def put_locale(
        # Path param: Locale code (e.g., `es`, `fr`, `pt-BR`).
        locale_id,
        # Path param: Notification template ID (`nt_` prefix).
        id:,
        # Body param: Elements with locale-specific content overrides.
        elements:,
        # Body param: Template state. Defaults to `DRAFT`.
        state: nil,
        request_options: {}
      )
      end

      # Replaces a notification template in full, so send every field rather than only
      # the ones you want changed. Publish separately to make it live.
      sig do
        params(
          id: String,
          notification: Courier::NotificationTemplateWritePayload::OrHash,
          state: Courier::NotificationTemplateUpdateRequest::State::OrSymbol,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::NotificationTemplateResponse)
      end
      def replace(
        # Template ID (nt\_ prefix).
        id,
        # Template fields accepted in POST and PUT request bodies, nested under a
        # `notification` key.
        notification:,
        # Template state after update. Case-insensitive input, normalized to uppercase in
        # the response. Defaults to "DRAFT".
        state: nil,
        request_options: {}
      )
      end

      # Returns a template's content and checksum. V2 templates return Elemental
      # elements, while V1 templates return blocks and channels instead.
      sig do
        params(
          id: String,
          version: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(
          Courier::Models::NotificationRetrieveContentResponse::Variants
        )
      end
      def retrieve_content(
        # Notification template ID (`nt_` prefix).
        id,
        # Accepts `draft`, `published`, or a version string (e.g., `v001`). Defaults to
        # `published`.
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
