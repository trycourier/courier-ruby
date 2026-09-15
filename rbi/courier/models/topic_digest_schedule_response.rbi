# typed: strong

module Courier
  module Models
    class TopicDigestScheduleResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::TopicDigestScheduleResponse,
            Courier::Internal::AnyHash
          )
        end

      # The schedule's identifier, assigned by the server. This is the value the
      # `/digests/schedules/{schedule_id}` endpoints are keyed by.
      sig { returns(String) }
      attr_accessor :schedule_id

      # ISO-8601 timestamp of when the schedule was created.
      sig { returns(T.nilable(String)) }
      attr_reader :created

      sig { params(created: String).void }
      attr_writer :created

      # Day of the month, 1-31.
      sig { returns(T.nilable(Integer)) }
      attr_reader :day_of_month

      sig { params(day_of_month: Integer).void }
      attr_writer :day_of_month

      # A day of the week. Accepted case-insensitively, returned lowercase.
      sig { returns(T.nilable(Courier::DigestDayOfWeek::TaggedSymbol)) }
      attr_reader :day_of_week

      sig { params(day_of_week: Courier::DigestDayOfWeek::OrSymbol).void }
      attr_writer :day_of_week

      sig do
        returns(T.nilable(T::Array[Courier::DigestDayOfWeek::TaggedSymbol]))
      end
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

      # Omitted for a stored schedule this enum cannot express. Those schedules never
      # fire, but their `schedule_id` is still returned so the `/digests/*` endpoints
      # remain reachable for them.
      sig { returns(T.nilable(Courier::DigestFrequency::TaggedSymbol)) }
      attr_reader :frequency

      sig { params(frequency: Courier::DigestFrequency::OrSymbol).void }
      attr_writer :frequency

      # Whether this is the schedule recipients are placed on by default.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_default

      sig { params(is_default: T::Boolean).void }
      attr_writer :is_default

      # 24-hour local delivery time, `HH:MM`.
      sig { returns(T.nilable(String)) }
      attr_reader :time

      sig { params(time: String).void }
      attr_writer :time

      # IANA timezone the schedule is expressed in. Absent means UTC.
      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

      # ISO-8601 timestamp of the last update.
      sig { returns(T.nilable(String)) }
      attr_reader :updated

      sig { params(updated: String).void }
      attr_writer :updated

      # A delivery cadence for a topic's digest, with its assigned id.
      sig do
        params(
          schedule_id: String,
          created: String,
          day_of_month: Integer,
          day_of_week: Courier::DigestDayOfWeek::OrSymbol,
          days_of_week: T::Array[Courier::DigestDayOfWeek::OrSymbol],
          disabled: T::Boolean,
          frequency: Courier::DigestFrequency::OrSymbol,
          is_default: T::Boolean,
          time: String,
          timezone: String,
          updated: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The schedule's identifier, assigned by the server. This is the value the
        # `/digests/schedules/{schedule_id}` endpoints are keyed by.
        schedule_id:,
        # ISO-8601 timestamp of when the schedule was created.
        created: nil,
        # Day of the month, 1-31.
        day_of_month: nil,
        # A day of the week. Accepted case-insensitively, returned lowercase.
        day_of_week: nil,
        days_of_week: nil,
        # Whether the schedule is disabled.
        disabled: nil,
        # Omitted for a stored schedule this enum cannot express. Those schedules never
        # fire, but their `schedule_id` is still returned so the `/digests/*` endpoints
        # remain reachable for them.
        frequency: nil,
        # Whether this is the schedule recipients are placed on by default.
        is_default: nil,
        # 24-hour local delivery time, `HH:MM`.
        time: nil,
        # IANA timezone the schedule is expressed in. Absent means UTC.
        timezone: nil,
        # ISO-8601 timestamp of the last update.
        updated: nil
      )
      end

      sig do
        override.returns(
          {
            schedule_id: String,
            created: String,
            day_of_month: Integer,
            day_of_week: Courier::DigestDayOfWeek::TaggedSymbol,
            days_of_week: T::Array[Courier::DigestDayOfWeek::TaggedSymbol],
            disabled: T::Boolean,
            frequency: Courier::DigestFrequency::TaggedSymbol,
            is_default: T::Boolean,
            time: String,
            timezone: String,
            updated: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
