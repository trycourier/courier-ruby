# typed: strong

module Courier
  module Models
    class BroadcastSchedule < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::BroadcastSchedule, Courier::Internal::AnyHash)
        end

      # ID of the target list or audience.
      sig { returns(String) }
      attr_accessor :recipient_id

      # Whether the broadcast targets a list or an audience.
      sig { returns(Courier::BroadcastSchedule::RecipientType::TaggedSymbol) }
      attr_accessor :recipient_type

      # Wall-clock timestamp of the scheduled send, no timezone offset (e.g.
      # "2026-07-21T20:00:00").
      sig { returns(T.nilable(String)) }
      attr_accessor :scheduled_to

      # IANA timezone for the scheduled send (e.g. America/New_York).
      sig { returns(T.nilable(String)) }
      attr_accessor :timezone

      # The delivery schedule and recipient targeting for a broadcast.
      sig do
        params(
          recipient_id: String,
          recipient_type: Courier::BroadcastSchedule::RecipientType::OrSymbol,
          scheduled_to: T.nilable(String),
          timezone: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the target list or audience.
        recipient_id:,
        # Whether the broadcast targets a list or an audience.
        recipient_type:,
        # Wall-clock timestamp of the scheduled send, no timezone offset (e.g.
        # "2026-07-21T20:00:00").
        scheduled_to: nil,
        # IANA timezone for the scheduled send (e.g. America/New_York).
        timezone: nil
      )
      end

      sig do
        override.returns(
          {
            recipient_id: String,
            recipient_type:
              Courier::BroadcastSchedule::RecipientType::TaggedSymbol,
            scheduled_to: T.nilable(String),
            timezone: T.nilable(String)
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
            T.all(Symbol, Courier::BroadcastSchedule::RecipientType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(:list, Courier::BroadcastSchedule::RecipientType::TaggedSymbol)
        AUDIENCE =
          T.let(
            :audience,
            Courier::BroadcastSchedule::RecipientType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::BroadcastSchedule::RecipientType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
