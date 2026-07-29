# frozen_string_literal: true

module Courier
  module Models
    class ScheduleBroadcastRequest < Courier::Internal::Type::BaseModel
      # @!attribute recipient_id
      #   ID of the target list or audience.
      #
      #   @return [String]
      required :recipient_id, String

      # @!attribute recipient_type
      #   Whether the broadcast targets a list or an audience.
      #
      #   @return [Symbol, Courier::Models::ScheduleBroadcastRequest::RecipientType]
      required :recipient_type, enum: -> { Courier::ScheduleBroadcastRequest::RecipientType }

      # @!attribute scheduled_to
      #   Wall-clock timestamp of the future send, no timezone offset (e.g.
      #   "2026-07-21T20:00:00"). The zone is given by `timezone`.
      #
      #   @return [String]
      required :scheduled_to, String

      # @!attribute timezone
      #   IANA timezone for the scheduled send (e.g. America/New_York).
      #
      #   @return [String, nil]
      optional :timezone, String

      # @!method initialize(recipient_id:, recipient_type:, scheduled_to:, timezone: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ScheduleBroadcastRequest} for more details.
      #
      #   Request body for scheduling a broadcast for a future send.
      #
      #   @param recipient_id [String] ID of the target list or audience.
      #
      #   @param recipient_type [Symbol, Courier::Models::ScheduleBroadcastRequest::RecipientType] Whether the broadcast targets a list or an audience.
      #
      #   @param scheduled_to [String] Wall-clock timestamp of the future send, no timezone offset (e.g. "2026-07-21T20
      #
      #   @param timezone [String] IANA timezone for the scheduled send (e.g. America/New_York).

      # Whether the broadcast targets a list or an audience.
      #
      # @see Courier::Models::ScheduleBroadcastRequest#recipient_type
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
