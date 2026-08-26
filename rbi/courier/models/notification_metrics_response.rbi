# typed: strong

module Courier
  module Models
    class NotificationMetricsResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::NotificationMetricsResponse,
            Courier::Internal::AnyHash
          )
        end

      # End of the window actually queried, ceiled onto the granularity grid.
      # Second-precision UTC.
      sig { returns(Time) }
      attr_accessor :end_

      # Bucket size the series was built at.
      sig do
        returns(Courier::NotificationMetricsResponse::Granularity::TaggedSymbol)
      end
      attr_accessor :granularity

      # The template the series describes, echoed from the request.
      sig { returns(String) }
      attr_accessor :notification_id

      # One entry per bucket between `start` and `end`, oldest first, including buckets
      # with no activity.
      sig { returns(T::Array[Courier::NotificationMetricsResponse::Series]) }
      attr_accessor :series

      # Inclusive start of the window actually queried, floored onto the granularity
      # grid. Second-precision UTC.
      sig { returns(Time) }
      attr_accessor :start

      sig do
        params(
          end_: Time,
          granularity:
            Courier::NotificationMetricsResponse::Granularity::OrSymbol,
          notification_id: String,
          series:
            T::Array[Courier::NotificationMetricsResponse::Series::OrHash],
          start: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # End of the window actually queried, ceiled onto the granularity grid.
        # Second-precision UTC.
        end_:,
        # Bucket size the series was built at.
        granularity:,
        # The template the series describes, echoed from the request.
        notification_id:,
        # One entry per bucket between `start` and `end`, oldest first, including buckets
        # with no activity.
        series:,
        # Inclusive start of the window actually queried, floored onto the granularity
        # grid. Second-precision UTC.
        start:
      )
      end

      sig do
        override.returns(
          {
            end_: Time,
            granularity:
              Courier::NotificationMetricsResponse::Granularity::TaggedSymbol,
            notification_id: String,
            series: T::Array[Courier::NotificationMetricsResponse::Series],
            start: Time
          }
        )
      end
      def to_hash
      end

      # Bucket size the series was built at.
      module Granularity
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::NotificationMetricsResponse::Granularity)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HOUR =
          T.let(
            :HOUR,
            Courier::NotificationMetricsResponse::Granularity::TaggedSymbol
          )
        DAY =
          T.let(
            :DAY,
            Courier::NotificationMetricsResponse::Granularity::TaggedSymbol
          )
        WEEK =
          T.let(
            :WEEK,
            Courier::NotificationMetricsResponse::Granularity::TaggedSymbol
          )
        MONTH =
          T.let(
            :MONTH,
            Courier::NotificationMetricsResponse::Granularity::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::NotificationMetricsResponse::Granularity::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Series < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::NotificationMetricsResponse::Series,
              Courier::Internal::AnyHash
            )
          end

        # One entry per provider and channel that handled a message in this bucket. Empty
        # when nothing was sent.
        sig do
          returns(T::Array[Courier::NotificationMetricsResponse::Series::Data])
        end
        attr_accessor :data

        # Start of the bucket, second-precision UTC.
        sig { returns(Time) }
        attr_accessor :period

        sig do
          params(
            data:
              T::Array[
                Courier::NotificationMetricsResponse::Series::Data::OrHash
              ],
            period: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # One entry per provider and channel that handled a message in this bucket. Empty
          # when nothing was sent.
          data:,
          # Start of the bucket, second-precision UTC.
          period:
        )
        end

        sig do
          override.returns(
            {
              data:
                T::Array[Courier::NotificationMetricsResponse::Series::Data],
              period: Time
            }
          )
        end
        def to_hash
        end

        class Data < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::NotificationMetricsResponse::Series::Data,
                Courier::Internal::AnyHash
              )
            end

          # Channel the provider delivered on, e.g. `email`.
          sig { returns(String) }
          attr_accessor :channel

          # Messages with at least one tracked link click.
          sig { returns(Integer) }
          attr_accessor :clicked

          # Messages the provider confirmed as delivered.
          sig { returns(Integer) }
          attr_accessor :delivered

          # Messages the provider rejected or failed on, including ones a later provider
          # then delivered.
          sig { returns(Integer) }
          attr_accessor :errors

          # Messages opened at least once. Always `0` on channels with no open tracking.
          sig { returns(Integer) }
          attr_accessor :opened

          # Provider that handled the messages, e.g. `sendgrid`.
          sig { returns(String) }
          attr_accessor :provider

          # Messages handed to the provider.
          sig { returns(Integer) }
          attr_accessor :sent

          # Messages Courier could not deliver on any provider for the channel.
          sig { returns(Integer) }
          attr_accessor :undeliverable

          sig do
            params(
              channel: String,
              clicked: Integer,
              delivered: Integer,
              errors: Integer,
              opened: Integer,
              provider: String,
              sent: Integer,
              undeliverable: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Channel the provider delivered on, e.g. `email`.
            channel:,
            # Messages with at least one tracked link click.
            clicked:,
            # Messages the provider confirmed as delivered.
            delivered:,
            # Messages the provider rejected or failed on, including ones a later provider
            # then delivered.
            errors:,
            # Messages opened at least once. Always `0` on channels with no open tracking.
            opened:,
            # Provider that handled the messages, e.g. `sendgrid`.
            provider:,
            # Messages handed to the provider.
            sent:,
            # Messages Courier could not deliver on any provider for the channel.
            undeliverable:
          )
          end

          sig do
            override.returns(
              {
                channel: String,
                clicked: Integer,
                delivered: Integer,
                errors: Integer,
                opened: Integer,
                provider: String,
                sent: Integer,
                undeliverable: Integer
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
