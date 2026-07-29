# frozen_string_literal: true

module Courier
  module Models
    class BroadcastSchedule < Courier::Internal::Type::BaseModel
      # @!attribute recipient_id
      #   ID of the target list or audience.
      #
      #   @return [String]
      required :recipient_id, String

      # @!attribute recipient_type
      #   Whether the broadcast targets a list or an audience.
      #
      #   @return [Symbol, Courier::Models::BroadcastSchedule::RecipientType]
      required :recipient_type, enum: -> { Courier::BroadcastSchedule::RecipientType }

      # @!attribute scheduled_to
      #   Wall-clock timestamp of the scheduled send, no timezone offset (e.g.
      #   "2026-07-21T20:00:00").
      #
      #   @return [String, nil]
      optional :scheduled_to, String, nil?: true

      # @!attribute timezone
      #   IANA timezone for the scheduled send (e.g. America/New_York).
      #
      #   @return [String, nil]
      optional :timezone, String, nil?: true

      # @!method initialize(recipient_id:, recipient_type:, scheduled_to: nil, timezone: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::BroadcastSchedule} for more details.
      #
      #   The delivery schedule and recipient targeting for a broadcast.
      #
      #   @param recipient_id [String] ID of the target list or audience.
      #
      #   @param recipient_type [Symbol, Courier::Models::BroadcastSchedule::RecipientType] Whether the broadcast targets a list or an audience.
      #
      #   @param scheduled_to [String, nil] Wall-clock timestamp of the scheduled send, no timezone offset (e.g. "2026-07-21
      #
      #   @param timezone [String, nil] IANA timezone for the scheduled send (e.g. America/New_York).

      # Whether the broadcast targets a list or an audience.
      #
      # @see Courier::Models::BroadcastSchedule#recipient_type
      module RecipientType
        extend Courier::Internal::Type::Enum

        LIST = :list
        AUDIENCE = :audience

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
