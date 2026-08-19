# typed: strong

module Courier
  module Resources
    class Journeys
      # Build, version, publish, invoke, and cancel multi-step notification workflows,
      # along with the templates scoped to them.
      class Runs
        # Fetch one Journey run by id. Returns `404` for an unknown run, a run belonging
        # to another workspace, a run past the 95-day retention window, or an Automation
        # run id — the same body in every case, so the response never reveals whether a
        # run exists elsewhere.
        sig do
          params(
            run_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::JourneyRunResponse)
        end
        def retrieve(
          # A unique identifier representing the Journey run.
          run_id,
          request_options: {}
        )
        end

        # List runs of the workspace's Journeys, newest first, filtered by status,
        # Journey, or date range and paged by cursor. Runs of v2 Automations are listed by
        # `GET /automations/runs` instead — the two surfaces never return each other's
        # runs. Runs are retained for 95 days.
        sig do
          params(
            cursor: String,
            end_date: String,
            limit: String,
            start_date: String,
            status: String,
            template_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::JourneyRunListResponse)
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
          # A comma-separated list of Journey ids to filter on.
          template_id: nil,
          request_options: {}
        )
        end

        # List the per-node state of one Journey run, in full — this endpoint is not
        # paginated. Each step's `node_id` is the id of the node in the published Journey,
        # so a step maps directly onto the Journey graph. `message_id` is present on send
        # steps that produced a message; follow it to `GET /messages/{message_id}` for
        # delivery status.
        sig do
          params(
            run_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::JourneyRunStepsResponse)
        end
        def list_steps(
          # A unique identifier representing the Journey run.
          run_id,
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
