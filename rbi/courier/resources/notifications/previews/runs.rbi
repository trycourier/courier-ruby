# typed: strong

module Courier
  module Resources
    class Notifications
      class Previews
        # Render a template's email content on real email clients and read back the
        # screenshots, so you can check how it looks before you send it.
        class Runs
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
          sig do
            params(
              id: String,
              data: T::Hash[Symbol, T.anything],
              device_ids: T::Array[String],
              device_set_id: String,
              locale: String,
              template_version: String,
              idempotency_key: String,
              x_idempotency_expiration: String,
              request_options: Courier::RequestOptions::OrHash
            ).returns(Courier::Notifications::Previews::PreviewRun)
          end
          def create(
            # Path param: Template ID (nt\_ prefix). Must be a Design Studio template.
            id,
            # Body param: Template variables to render with, the same shape as the `data`
            # object on a send.
            data: nil,
            # Body param: The devices to render on, by `PreviewDevice.id`, for a one-off run.
            # Mutually exclusive with `device_set_id`.
            device_ids: nil,
            # Body param: A saved device set naming the devices to render on. Mutually
            # exclusive with `device_ids`.
            device_set_id: nil,
            # Body param: Render the template's content for this locale, e.g. "fr-FR".
            locale: nil,
            # Body param: Which version of the template to render. Omit for the latest saved
            # draft, which always exists and is what the editor shows. `published` renders the
            # live version; a zero-padded `v002` renders that specific publish. Versions are
            # 1-based, so `v000` is not a version, and the unpadded `v2` is rejected — that
            # spelling belongs to journeys' AutomationVersionId, a different scheme in which
            # `v0` means published.
            template_version: nil,
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
          sig do
            params(
              preview_run_id: String,
              id: String,
              request_options: Courier::RequestOptions::OrHash
            ).returns(Courier::Notifications::Previews::PreviewRunDetail)
          end
          def retrieve(
            # The preview run to retrieve, identified by the `id` returned when it was
            # created.
            preview_run_id,
            # Template ID (nt\_ prefix).
            id:,
            request_options: {}
          )
          end

          # List this template's preview runs, newest first. Cursor-paginated.
          #
          # A template that does not exist is a 404, the same as every other
          # `/notifications/{id}` route.
          sig do
            params(
              id: String,
              cursor: T.nilable(String),
              limit: Integer,
              request_options: Courier::RequestOptions::OrHash
            ).returns(Courier::Notifications::Previews::PreviewRunListResponse)
          end
          def list(
            # Template ID (nt\_ prefix).
            id,
            # Opaque pagination cursor from a previous response. Omit for the first page.
            cursor: nil,
            # Maximum number of results per page.
            limit: nil,
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
  end
end
