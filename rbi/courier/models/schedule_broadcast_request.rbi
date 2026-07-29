# typed: strong

module Courier
  module Models
    class ScheduleBroadcastRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::ScheduleBroadcastRequest, Courier::Internal::AnyHash)
        end

      # ID of the target list or audience.
      sig { returns(String) }
      attr_accessor :recipient_id

      # Whether the broadcast targets a list or an audience.
      sig do
        returns(Courier::ScheduleBroadcastRequest::RecipientType::OrSymbol)
      end
      attr_accessor :recipient_type

      # Wall-clock timestamp of the future send, no timezone offset (e.g.
      # "2026-07-21T20:00:00"). The zone is given by `timezone`.
      sig { returns(String) }
      attr_accessor :scheduled_to

      # IANA timezone for the scheduled send (e.g. America/New_York).
      sig { returns(T.nilable(String)) }
      attr_reader :timezone

      sig { params(timezone: String).void }
      attr_writer :timezone

      # Request body for scheduling a broadcast for a future send.
      sig do
        params(
          recipient_id: String,
          recipient_type:
            Courier::ScheduleBroadcastRequest::RecipientType::OrSymbol,
          scheduled_to: String,
          timezone: String
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the target list or audience.
        recipient_id:,
        # Whether the broadcast targets a list or an audience.
        recipient_type:,
        # Wall-clock timestamp of the future send, no timezone offset (e.g.
        # "2026-07-21T20:00:00"). The zone is given by `timezone`.
        scheduled_to:,
        # IANA timezone for the scheduled send (e.g. America/New_York).
        timezone: nil
      )
      end

      sig do
        override.returns(
          {
            recipient_id: String,
            recipient_type:
              Courier::ScheduleBroadcastRequest::RecipientType::OrSymbol,
            scheduled_to: String,
            timezone: String
          }
        )
      end
      def to_hash
      end

      # Whether the broadcast targets a list or an audience.
      module RecipientType
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::ScheduleBroadcastRequest::RecipientType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(
            :list,
            Courier::ScheduleBroadcastRequest::RecipientType::TaggedSymbol
          )
        AUDIENCE =
          T.let(
            :audience,
            Courier::ScheduleBroadcastRequest::RecipientType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::ScheduleBroadcastRequest::RecipientType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
