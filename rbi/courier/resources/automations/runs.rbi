# typed: strong

module Courier
  module Resources
    class Automations
      # Invoke a stored automation template or an ad hoc automation defined in the
      # request.
      class Runs
        # List runs of the workspace's v2 Automations, newest first, filtered by status,
        # Template, or date range and paged by cursor. Journey (v3) runs are listed by
        # `GET /journeys/runs` instead — the two surfaces never return each other's runs.
        # Runs are retained for 95 days.
        sig do
          params(
            cursor: String,
            end_date: String,
            limit: String,
            start_date: String,
            status: String,
            template_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::AutomationRunListResponse)
        end
        def list(
          # A cursor token for pagination. Use the `next_cursor` from the previous response
          # to fetch the next page of results. Treat it as opaque.
          cursor: nil,
          # An inclusive upper bound on `created_at`, in the same format as `start_date`.
          end_date: nil,
          # The number of runs to return per page, between `1` and `50`. Defaults to `20`.
          # Values outside the range are clamped, and a non-numeric value falls back to
          # `20`.
          limit: nil,
          # An inclusive lower bound on `created_at`, as an ISO 8601 date or timestamp (e.g.
          # `2026-08-18` or `2026-08-18T20:06:36.259Z`). Any other format returns `400`.
          start_date: nil,
          # A comma-separated list of run statuses to filter on, e.g. `PROCESSED,ERROR`.
          status: nil,
          # A comma-separated list of Automation Template ids to filter on.
          template_id: nil,
          request_options: {}
        )
        end

        # List the per-step state of one Automation run, in full — this endpoint is not
        # paginated. `message_id` is present on send steps that produced a message; follow
        # it to `GET /messages/{message_id}` for delivery status. A send to a List or an
        # Audience yields one `message_id` for the request, not one per recipient.
        sig do
          params(
            id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::AutomationRunStepsResponse)
        end
        def list_steps(
          # A unique identifier representing the Automation run.
          id,
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
