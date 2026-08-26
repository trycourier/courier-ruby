# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Notifications#get_metrics
    class NotificationGetMetricsParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute end_
      #   The end of the window, as an ISO 8601 timestamp with an offset. Must be supplied
      #   together with `start`. An `end` in the future is accepted and not clamped — the
      #   trailing buckets come back empty.
      #
      #   @return [Time, nil]
      optional :end_, Time

      # @!attribute granularity
      #   The size of each bucket in the series. Defaults to `DAY`. `WEEK` buckets start
      #   on Sunday. A fine granularity caps the window it can cover: `HOUR` spans at most
      #   7 days and `DAY` at most 90 days, and a wider window returns `400` — request a
      #   coarser granularity instead. `WEEK` and `MONTH` are uncapped, subject to the
      #   1000-bucket limit on a single response.
      #
      #   @return [Symbol, Courier::Models::NotificationGetMetricsParams::Granularity, nil]
      optional :granularity, enum: -> { Courier::NotificationGetMetricsParams::Granularity }

      # @!attribute lookback
      #   The length of the window, counted back from now, as an ISO 8601 duration
      #   (`P30D`, `P12W`, `PT12H`). Defaults to `P30D`, and is ignored when `start` and
      #   `end` are supplied. A malformed or non-positive duration returns `400`.
      #
      #   @return [String, nil]
      optional :lookback, String

      # @!attribute start
      #   The inclusive start of the window, as an ISO 8601 timestamp with an offset
      #   (`2026-04-01T00:00:00Z`). Must be supplied together with `end` and be earlier
      #   than it; either one alone returns `400`.
      #
      #   @return [Time, nil]
      optional :start, Time

      # @!method initialize(id:, end_: nil, granularity: nil, lookback: nil, start: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::NotificationGetMetricsParams} for more details.
      #
      #   @param id [String]
      #
      #   @param end_ [Time] The end of the window, as an ISO 8601 timestamp with an offset. Must be supplied
      #
      #   @param granularity [Symbol, Courier::Models::NotificationGetMetricsParams::Granularity] The size of each bucket in the series. Defaults to `DAY`. `WEEK` buckets start o
      #
      #   @param lookback [String] The length of the window, counted back from now, as an ISO 8601 duration (`P30D`
      #
      #   @param start [Time] The inclusive start of the window, as an ISO 8601 timestamp with an offset (`202
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]

      # The size of each bucket in the series. Defaults to `DAY`. `WEEK` buckets start
      # on Sunday. A fine granularity caps the window it can cover: `HOUR` spans at most
      # 7 days and `DAY` at most 90 days, and a wider window returns `400` — request a
      # coarser granularity instead. `WEEK` and `MONTH` are uncapped, subject to the
      # 1000-bucket limit on a single response.
      module Granularity
        extend Courier::Internal::Type::Enum

        HOUR = :HOUR
        DAY = :DAY
        WEEK = :WEEK
        MONTH = :MONTH

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
