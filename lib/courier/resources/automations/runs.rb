# frozen_string_literal: true

module Courier
  module Resources
    class Automations
      # Invoke a stored automation template or an ad hoc automation defined in the
      # request.
      class Runs
        # Some parameter documentations has been truncated, see
        # {Courier::Models::Automations::RunListParams} for more details.
        #
        # List runs of the workspace's v2 Automations, newest first, filtered by status,
        # Template, or date range and paged by cursor. Journey (v3) runs are listed by
        # `GET /journeys/runs` instead — the two surfaces never return each other's runs.
        # Runs are retained for 95 days.
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
        # @param template_id [String] A comma-separated list of Automation Template ids to filter on.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::AutomationRunListResponse]
        #
        # @see Courier::Models::Automations::RunListParams
        def list(params = {})
          parsed, options = Courier::Automations::RunListParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "automations/runs",
            query: query,
            model: Courier::AutomationRunListResponse,
            options: options
          )
        end

        # List the per-step state of one Automation run, in full — this endpoint is not
        # paginated. `message_id` is present on send steps that produced a message; follow
        # it to `GET /messages/{message_id}` for delivery status. A send to a List or an
        # Audience yields one `message_id` for the request, not one per recipient.
        #
        # @overload list_steps(id, request_options: {})
        #
        # @param id [String] A unique identifier representing the Automation run.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::AutomationRunStepsResponse]
        #
        # @see Courier::Models::Automations::RunListStepsParams
        def list_steps(id, params = {})
          @client.request(
            method: :get,
            path: ["automations/runs/%1$s/steps", id],
            model: Courier::AutomationRunStepsResponse,
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
