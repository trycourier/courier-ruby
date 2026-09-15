# frozen_string_literal: true

module Courier
  module Models
    class TopicDigestScheduleRequest < Courier::Internal::Type::BaseModel
      # @!attribute frequency
      #   How often a digest is delivered. `instant` delivers immediately without
      #   batching, and is the one value that takes no `time`.
      #
      #   @return [Symbol, Courier::Models::DigestFrequency]
      required :frequency, enum: -> { Courier::DigestFrequency }

      # @!attribute day_of_month
      #   Required when `frequency` is `monthly`.
      #
      #   @return [Integer, nil]
      optional :day_of_month, Integer

      # @!attribute day_of_week
      #   Required when `frequency` is `weekly`.
      #
      #   @return [Symbol, Courier::Models::DigestDayOfWeek, nil]
      optional :day_of_week, enum: -> { Courier::DigestDayOfWeek }

      # @!attribute days_of_week
      #   Required when `frequency` is `custom_days`.
      #
      #   @return [Array<Symbol, Courier::Models::DigestDayOfWeek>, nil]
      optional :days_of_week, -> { Courier::Internal::Type::ArrayOf[enum: Courier::DigestDayOfWeek] }

      # @!attribute disabled
      #   Whether the schedule is disabled.
      #
      #   @return [Boolean, nil]
      optional :disabled, Courier::Internal::Type::Boolean

      # @!attribute is_default
      #   The schedule recipients are placed on when they have not chosen one. Set this
      #   explicitly rather than relying on array position.
      #
      #   @return [Boolean, nil]
      optional :is_default, Courier::Internal::Type::Boolean

      # @!attribute schedule_id
      #   Identifier of an existing schedule to update. Omit when creating a new one.
      #
      #   @return [String, nil]
      optional :schedule_id, String

      # @!attribute time
      #   24-hour local delivery time, `HH:MM`. Required for every frequency except
      #   `instant`.
      #
      #   @return [String, nil]
      optional :time, String

      # @!attribute timezone
      #   IANA timezone the `time` and day fields are expressed in, e.g.
      #   `America/New_York`. Absent means UTC. Delivery follows the same local wall-clock
      #   across daylight-saving changes.
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(frequency:, day_of_month: nil, day_of_week: nil, days_of_week: nil, disabled: nil, is_default: nil, schedule_id: nil, time: nil, timezone: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::TopicDigestScheduleRequest} for more details.
      #
      #   One delivery cadence for a topic's digest. Supply `schedule_id` to update an
      #   existing schedule in place; omit it and one is assigned and returned. The
      #   `schedules` array is a full replacement, so a stored schedule absent from it is
      #   deleted along with its delivery rule.
      #
      #   @param frequency [Symbol, Courier::Models::DigestFrequency] How often a digest is delivered. `instant` delivers immediately without batching
      #
      #   @param day_of_month [Integer] Required when `frequency` is `monthly`.
      #
      #   @param day_of_week [Symbol, Courier::Models::DigestDayOfWeek] Required when `frequency` is `weekly`.
      #
      #   @param days_of_week [Array<Symbol, Courier::Models::DigestDayOfWeek>] Required when `frequency` is `custom_days`.
      #
      #   @param disabled [Boolean] Whether the schedule is disabled.
      #
      #   @param is_default [Boolean] The schedule recipients are placed on when they have not chosen one. Set this ex
      #
      #   @param schedule_id [String] Identifier of an existing schedule to update. Omit when creating a new one.
      #
      #   @param time [String] 24-hour local delivery time, `HH:MM`. Required for every frequency except `insta
      #
      #   @param timezone [String] IANA timezone the `time` and day fields are expressed in, e.g. `America/New_York
    end
  end
end
