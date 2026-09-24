# frozen_string_literal: true

module Courier
  module Resources
    class Notifications
      class Previews
        # Render a template's email content on real email clients and read back the
        # screenshots, so you can check how it looks before you send it.
        class Runs
          # Some parameter documentations has been truncated, see
          # {Courier::Models::Notifications::Previews::RunCreateParams} for more details.
          #
          # Render this template's email content on each of the requested devices.
          #
          # Returns as soon as the run exists and its render is queued — the screenshots are
          # produced asynchronously. Poll
          # `GET /notifications/{id}/previews/runs/{previewRunId}` until every result
          # reaches a terminal status.
          #
          # Name the devices either with `device_set_id`, for a saved set, or with
          # `device_ids`, for a one-off list. Exactly one of the two is required. Inline
          # `device_ids` must be ids listed by `GET /previews/devices`; any other id is a
          # 422, refused before the run exists or is billed.
          #
          # A template that does not exist is a 404. One that exists but cannot be previewed
          # — not a Design Studio template, no email channel, or no such `template_version`
          # — is a 422, also refused before the run exists or is billed.
          #
          # Preview runs are a metered add-on. A workspace without it, or with its billing
          # suspended, receives a 402.
          #
          # @overload create(id, data: nil, device_ids: nil, device_set_id: nil, locale: nil, template_version: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
          #
          # @param id [String] Path param: Template ID (nt\_ prefix). Must be a Design Studio template.
          #
          # @param data [Hash{Symbol=>Object}] Body param: Template variables to render with, the same shape as the `data` obje
          #
          # @param device_ids [Array<String>] Body param: The devices to render on, by `PreviewDevice.id`, for a one-off run.
          #
          # @param device_set_id [String] Body param: A saved device set naming the devices to render on. Mutually exclusi
          #
          # @param locale [String] Body param: Render the template's content for this locale, e.g. "fr-FR".
          #
          # @param template_version [String] Body param: Which version of the template to render. Omit for the latest saved d
          #
          # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
          #
          # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
          #
          # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Courier::Models::Notifications::Previews::PreviewRun]
          #
          # @see Courier::Models::Notifications::Previews::RunCreateParams
          def create(id, params = {})
            parsed, options = Courier::Notifications::Previews::RunCreateParams.dump_request(params)
            header_params =
              {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
            @client.request(
              method: :post,
              path: ["notifications/%1$s/previews/runs", id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Courier::Notifications::Previews::PreviewRun,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {Courier::Models::Notifications::Previews::RunRetrieveParams} for more details.
          #
          # Retrieve one of this template's preview runs together with its per-device
          # results.
          #
          # A run is only readable under the template it previewed: under any other template
          # it is a 404, the same as a run that does not exist.
          #
          # `thumbnail_url` and `screenshot_url` are short-lived signed URLs, re-signed on
          # every read. Fetch them now rather than storing them. Both are null until
          # Courier's own copy of the image exists, which is what `status: COMPLETED` on a
          # result means.
          #
          # @overload retrieve(preview_run_id, id:, request_options: {})
          #
          # @param preview_run_id [String] The preview run to retrieve, identified by the `id` returned when it was created
          #
          # @param id [String] Template ID (nt\_ prefix).
          #
          # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Courier::Models::Notifications::Previews::PreviewRunDetail]
          #
          # @see Courier::Models::Notifications::Previews::RunRetrieveParams
          def retrieve(preview_run_id, params)
            parsed, options = Courier::Notifications::Previews::RunRetrieveParams.dump_request(params)
            id =
              parsed.delete(:id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["notifications/%1$s/previews/runs/%2$s", id, preview_run_id],
              model: Courier::Notifications::Previews::PreviewRunDetail,
              options: options
            )
          end

          # List this template's preview runs, newest first. Cursor-paginated.
          #
          # A template that does not exist is a 404, the same as every other
          # `/notifications/{id}` route.
          #
          # @overload list(id, cursor: nil, limit: nil, request_options: {})
          #
          # @param id [String] Template ID (nt\_ prefix).
          #
          # @param cursor [String, nil] Opaque pagination cursor from a previous response. Omit for the first page.
          #
          # @param limit [Integer] Maximum number of results per page.
          #
          # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Courier::Models::Notifications::Previews::PreviewRunListResponse]
          #
          # @see Courier::Models::Notifications::Previews::RunListParams
          def list(id, params = {})
            parsed, options = Courier::Notifications::Previews::RunListParams.dump_request(params)
            query = Courier::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: ["notifications/%1$s/previews/runs", id],
              query: query,
              model: Courier::Notifications::Previews::PreviewRunListResponse,
              options: options
            )
          end

          # @api private
          #
          # @param client [Courier::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
