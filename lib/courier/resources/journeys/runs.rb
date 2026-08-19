# frozen_string_literal: true

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
        #
        # @overload retrieve(run_id, request_options: {})
        #
        # @param run_id [String] A unique identifier representing the Journey run.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyRunResponse]
        #
        # @see Courier::Models::Journeys::RunRetrieveParams
        def retrieve(run_id, params = {})
          @client.request(
            method: :get,
            path: ["journeys/runs/%1$s", run_id],
            model: Courier::JourneyRunResponse,
            options: params[:request_options]
          )
        end

        # Some parameter documentations has been truncated, see
        # {Courier::Models::Journeys::RunListParams} for more details.
        #
        # List runs of the workspace's Journeys, newest first, filtered by status,
        # Journey, or date range and paged by cursor. Runs of v2 Automations are listed by
        # `GET /automations/runs` instead — the two surfaces never return each other's
        # runs. Runs are retained for 95 days.
        #
        # @overload list(cursor: nil, end_date: nil, limit: nil, start_date: nil, status: nil, template_id: nil, request_options: {})
        #
        # @param cursor [String] A cursor token for pagination. Use the `next_cursor` from the previous response
        #
        # @param end_date [String] An inclusive upper bound on `created_at`, in the same format as `start_date`.
        #
        # @param limit [String] The number of runs to return per page, between `1` and `50`. Defaults to `20`. V
        #
        # @param start_date [String] An inclusive lower bound on `created_at`, as an ISO 8601 date or timestamp (e.g.
        #
        # @param status [String] A comma-separated list of run statuses to filter on, e.g. `PROCESSED,ERROR`.
        #
        # @param template_id [String] A comma-separated list of Journey ids to filter on.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyRunListResponse]
        #
        # @see Courier::Models::Journeys::RunListParams
        def list(params = {})
          parsed, options = Courier::Journeys::RunListParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "journeys/runs",
            query: query,
            model: Courier::JourneyRunListResponse,
            options: options
          )
        end

        # List the per-node state of one Journey run, in full — this endpoint is not
        # paginated. Each step's `node_id` is the id of the node in the published Journey,
        # so a step maps directly onto the Journey graph. `message_id` is present on send
        # steps that produced a message; follow it to `GET /messages/{message_id}` for
        # delivery status.
        #
        # @overload list_steps(run_id, request_options: {})
        #
        # @param run_id [String] A unique identifier representing the Journey run.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::JourneyRunStepsResponse]
        #
        # @see Courier::Models::Journeys::RunListStepsParams
        def list_steps(run_id, params = {})
          @client.request(
            method: :get,
            path: ["journeys/runs/%1$s/steps", run_id],
            model: Courier::JourneyRunStepsResponse,
            options: params[:request_options]
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
