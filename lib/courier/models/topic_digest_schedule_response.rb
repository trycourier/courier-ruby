# frozen_string_literal: true

module Courier
  module Models
    class TopicDigestScheduleResponse < Courier::Internal::Type::BaseModel
      # @!attribute schedule_id
      #   The schedule's identifier, assigned by the server. This is the value the
      #   `/digests/schedules/{schedule_id}` endpoints are keyed by.
      #
      #   Two formats are in circulation and only one is safe to drop into a URL.
      #   Schedules created through the API are `sch_01m26xfcn3endt3nxy4e2kx2rh` and need
      #   no encoding. Schedules created in the Preferences Editor before that format are
      #   `sch/{uuid}` and contain a literal `/`, so they must be URL-encoded as
      #   `sch%2F{uuid}` — unencoded, the path does not match the route and the response
      #   is a bare `404` that reads like a broken endpoint. Existing ids are never
      #   migrated.
      #
      #   @return [String]
      required :schedule_id, String

      # @!attribute created
      #   ISO-8601 timestamp of when the schedule was created.
      #
      #   @return [String, nil]
      optional :created, String

      # @!attribute day_of_month
      #   Day of the month, 1-31.
      #
      #   @return [Integer, nil]
      optional :day_of_month, Integer

      # @!attribute day_of_week
      #   A day of the week. Accepted case-insensitively, returned lowercase.
      #
      #   @return [Symbol, Courier::Models::DigestDayOfWeek, nil]
      optional :day_of_week, enum: -> { Courier::DigestDayOfWeek }

      # @!attribute days_of_week
      #
      #   @return [Array<Symbol, Courier::Models::DigestDayOfWeek>, nil]
      optional :days_of_week, -> { Courier::Internal::Type::ArrayOf[enum: Courier::DigestDayOfWeek] }

      # @!attribute disabled
      #   Whether the schedule is disabled.
      #
      #   @return [Boolean, nil]
      optional :disabled, Courier::Internal::Type::Boolean

      # @!attribute frequency
      #   Omitted for a stored schedule this enum cannot express. Those schedules never
      #   fire, but their `schedule_id` is still returned so the `/digests/*` endpoints
      #   remain reachable for them.
      #
      #   @return [Symbol, Courier::Models::DigestFrequency, nil]
      optional :frequency, enum: -> { Courier::DigestFrequency }

      # @!attribute is_default
      #   Whether this is the schedule recipients are placed on by default.
      #
      #   @return [Boolean, nil]
      optional :is_default, Courier::Internal::Type::Boolean

      # @!attribute time
      #   24-hour local delivery time, `HH:MM`.
      #
      #   @return [String, nil]
      optional :time, String

      # @!attribute timezone
      #   IANA timezone the schedule is expressed in. Absent means UTC.
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!attribute updated
      #   ISO-8601 timestamp of the last update.
      #
      #   @return [String, nil]
      optional :updated, String

      # @!method initialize(schedule_id:, created: nil, day_of_month: nil, day_of_week: nil, days_of_week: nil, disabled: nil, frequency: nil, is_default: nil, time: nil, timezone: nil, updated: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TopicDigestScheduleResponse} for more details.
      #
      #   A delivery cadence for a topic's digest, with its assigned id.
      #
      #   @param schedule_id [String] The schedule's identifier, assigned by the server. This is the value the `/diges
      #
      #   @param created [String] ISO-8601 timestamp of when the schedule was created.
      #
      #   @param day_of_month [Integer] Day of the month, 1-31.
      #
      #   @param day_of_week [Symbol, Courier::Models::DigestDayOfWeek] A day of the week. Accepted case-insensitively, returned lowercase.
      #
      #   @param days_of_week [Array<Symbol, Courier::Models::DigestDayOfWeek>]
      #
      #   @param disabled [Boolean] Whether the schedule is disabled.
      #
      #   @param frequency [Symbol, Courier::Models::DigestFrequency] Omitted for a stored schedule this enum cannot express. Those schedules never fi
      #
      #   @param is_default [Boolean] Whether this is the schedule recipients are placed on by default.
      #
      #   @param time [String] 24-hour local delivery time, `HH:MM`.
      #
      #   @param timezone [String] IANA timezone the schedule is expressed in. Absent means UTC.
      #
      #   @param updated [String] ISO-8601 timestamp of the last update.
    end
  end
end
