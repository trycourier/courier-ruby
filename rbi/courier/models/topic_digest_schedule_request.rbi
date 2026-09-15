# typed: strong

module Courier
  module Models
    class TopicDigestScheduleRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::TopicDigestScheduleRequest, Courier::Internal::AnyHash)
        end

      # How often a digest is delivered. `instant` delivers immediately without
      # batching, and is the one value that takes no `time`.
      sig { returns(Courier::DigestFrequency::OrSymbol) }
      attr_accessor :frequency

      # Required when `frequency` is `monthly`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :day_of_month

      sig { params(day_of_month: Integer).void }
      attr_writer :day_of_month

      # Required when `frequency` is `weekly`.
      sig { returns(T.nilable(Courier::DigestDayOfWeek::OrSymbol)) }
      attr_reader :day_of_week

      sig { params(day_of_week: Courier::DigestDayOfWeek::OrSymbol).void }
      attr_writer :day_of_week

      # Required when `frequency` is `custom_days`.
      sig { returns(T.nilable(T::Array[Courier::DigestDayOfWeek::OrSymbol])) }
      attr_reader :days_of_week

      sig do
        params(days_of_week: T::Array[Courier::DigestDayOfWeek::OrSymbol]).void
      end
      attr_writer :days_of_week

      # Whether the schedule is disabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :disabled

      sig { params(disabled: T::Boolean).void }
      attr_writer :disabled

      # The schedule recipients are placed on when they have not chosen one. Set this
      # explicitly rather than relying on array position.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_default

      sig { params(is_default: T::Boolean).void }
      attr_writer :is_default

      # Identifier of an existing schedule to update. Omit when creating a new one.
      sig { returns(T.nilable(String)) }
      attr_reader :schedule_id

      sig { params(schedule_id: String).void }
      attr_writer :schedule_id

      # 24-hour local delivery time, `HH:MM`. Required for every frequency except
      # `instant`.
      sig { returns(T.nilable(String)) }
      attr_reader :time

      sig { params(time: String).void }
      attr_writer :time

      # IANA timezone the `time` and day fields are expressed in, e.g.
      # `America/New_York`. Absent means UTC. Delivery follows the same local wall-clock
      # across daylight-saving changes.
      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

      # One delivery cadence for a topic's digest. Supply `schedule_id` to update an
      # existing schedule in place; omit it and one is assigned and returned. The
      # `schedules` array is a full replacement, so a stored schedule absent from it is
      # deleted along with its delivery rule.
      sig do
        params(
          frequency: Courier::DigestFrequency::OrSymbol,
          day_of_month: Integer,
          day_of_week: Courier::DigestDayOfWeek::OrSymbol,
          days_of_week: T::Array[Courier::DigestDayOfWeek::OrSymbol],
          disabled: T::Boolean,
          is_default: T::Boolean,
          schedule_id: String,
          time: String,
          timezone: String
        ).returns(T.attached_class)
      end
      def self.new(
        # How often a digest is delivered. `instant` delivers immediately without
        # batching, and is the one value that takes no `time`.
        frequency:,
        # Required when `frequency` is `monthly`.
        day_of_month: nil,
        # Required when `frequency` is `weekly`.
        day_of_week: nil,
        # Required when `frequency` is `custom_days`.
        days_of_week: nil,
        # Whether the schedule is disabled.
        disabled: nil,
        # The schedule recipients are placed on when they have not chosen one. Set this
        # explicitly rather than relying on array position.
        is_default: nil,
        # Identifier of an existing schedule to update. Omit when creating a new one.
        schedule_id: nil,
        # 24-hour local delivery time, `HH:MM`. Required for every frequency except
        # `instant`.
        time: nil,
        # IANA timezone the `time` and day fields are expressed in, e.g.
        # `America/New_York`. Absent means UTC. Delivery follows the same local wall-clock
        # across daylight-saving changes.
        timezone: nil
      )
      end

      sig do
        override.returns(
          {
            frequency: Courier::DigestFrequency::OrSymbol,
            day_of_month: Integer,
            day_of_week: Courier::DigestDayOfWeek::OrSymbol,
            days_of_week: T::Array[Courier::DigestDayOfWeek::OrSymbol],
            disabled: T::Boolean,
            is_default: T::Boolean,
            schedule_id: String,
            time: String,
            timezone: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
