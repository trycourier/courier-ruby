# typed: strong

module Courier
  module Models
    class NotificationGetMetricsParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationGetMetricsParams,
            Courier::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # The end of the window, as an ISO 8601 timestamp with an offset. Must be supplied
      # together with `start`. An `end` in the future is accepted and not clamped — the
      # trailing buckets come back empty.
      sig { returns(T.nilable(Time)) }
      attr_reader :end_

      sig { params(end_: Time).void }
      attr_writer :end_

      # The size of each bucket in the series. Defaults to `DAY`. `WEEK` buckets start
      # on Sunday. A fine granularity caps the window it can cover: `HOUR` spans at most
      # 7 days and `DAY` at most 90 days, and a wider window returns `400` — request a
      # coarser granularity instead. `WEEK` and `MONTH` are uncapped, subject to the
      # 1000-bucket limit on a single response.
      sig do
        returns(
          T.nilable(
            Courier::NotificationGetMetricsParams::Granularity::OrSymbol
          )
        )
      end
      attr_reader :granularity

      sig do
        params(
          granularity:
            Courier::NotificationGetMetricsParams::Granularity::OrSymbol
        ).void
      end
      attr_writer :granularity

      # The length of the window, counted back from now, as an ISO 8601 duration
      # (`P30D`, `P12W`, `PT12H`). Defaults to `P30D`, and is ignored when `start` and
      # `end` are supplied. A malformed or non-positive duration returns `400`.
      sig { returns(T.nilable(String)) }
      attr_reader :lookback

      sig { params(lookback: String).void }
      attr_writer :lookback

      # The inclusive start of the window, as an ISO 8601 timestamp with an offset
      # (`2026-04-01T00:00:00Z`). Must be supplied together with `end` and be earlier
      # than it; either one alone returns `400`.
      sig { returns(T.nilable(Time)) }
      attr_reader :start

      sig { params(start: Time).void }
      attr_writer :start

      sig do
        params(
          id: String,
          end_: Time,
          granularity:
            Courier::NotificationGetMetricsParams::Granularity::OrSymbol,
          lookback: String,
          start: Time,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
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

      sig do
        override.returns(
          {
            id: String,
            end_: Time,
            granularity:
              Courier::NotificationGetMetricsParams::Granularity::OrSymbol,
            lookback: String,
            start: Time,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The size of each bucket in the series. Defaults to `DAY`. `WEEK` buckets start
      # on Sunday. A fine granularity caps the window it can cover: `HOUR` spans at most
      # 7 days and `DAY` at most 90 days, and a wider window returns `400` — request a
      # coarser granularity instead. `WEEK` and `MONTH` are uncapped, subject to the
      # 1000-bucket limit on a single response.
      module Granularity
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::NotificationGetMetricsParams::Granularity)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HOUR =
          T.let(
            :HOUR,
            Courier::NotificationGetMetricsParams::Granularity::TaggedSymbol
          )
        DAY =
          T.let(
            :DAY,
            Courier::NotificationGetMetricsParams::Granularity::TaggedSymbol
          )
        WEEK =
          T.let(
            :WEEK,
            Courier::NotificationGetMetricsParams::Granularity::TaggedSymbol
          )
        MONTH =
          T.let(
            :MONTH,
            Courier::NotificationGetMetricsParams::Granularity::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::NotificationGetMetricsParams::Granularity::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
