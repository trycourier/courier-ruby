# frozen_string_literal: true

module Courier
  module Models
    module Journeys
      # @see Courier::Resources::Journeys::Runs#list
      class RunListParams < Courier::Internal::Type::BaseModel
        extend Courier::Internal::Type::RequestParameters::Converter
        include Courier::Internal::Type::RequestParameters

        # @!attribute cursor
        #   A cursor token for pagination. Use the `next_cursor` from the previous response
        #   to fetch the next page of results. Treat it as opaque.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute end_date
        #   An inclusive upper bound on `created_at`, in the same format as `start_date`.
        #
        #   @return [String, nil]
        optional :end_date, String

        # @!attribute limit
        #   The number of runs to return per page, between `1` and `50`. Defaults to `20`.
        #   Values outside the range are clamped, and a non-numeric value falls back to
        #   `20`.
        #
        #   @return [String, nil]
        optional :limit, String

        # @!attribute start_date
        #   An inclusive lower bound on `created_at`, as an ISO 8601 date or timestamp (e.g.
        #   `2026-08-18` or `2026-08-18T20:06:36.259Z`). Any other format returns `400`.
        #
        #   @return [String, nil]
        optional :start_date, String

        # @!attribute status
        #   A comma-separated list of run statuses to filter on, e.g. `PROCESSED,ERROR`.
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute template_id
        #   A comma-separated list of Journey ids to filter on.
        #
        #   @return [String, nil]
        optional :template_id, String

        # @!method initialize(cursor: nil, end_date: nil, limit: nil, start_date: nil, status: nil, template_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::Journeys::RunListParams} for more details.
        #
        #   @param cursor [String] A cursor token for pagination. Use the `next_cursor` from the previous response
        #
        #   @param end_date [String] An inclusive upper bound on `created_at`, in the same format as `start_date`.
        #
        #   @param limit [String] The number of runs to return per page, between `1` and `50`. Defaults to `20`. V
        #
        #   @param start_date [String] An inclusive lower bound on `created_at`, as an ISO 8601 date or timestamp (e.g.
        #
        #   @param status [String] A comma-separated list of run statuses to filter on, e.g. `PROCESSED,ERROR`.
        #
        #   @param template_id [String] A comma-separated list of Journey ids to filter on.
        #
        #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
