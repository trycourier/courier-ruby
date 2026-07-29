# typed: strong

module Courier
  module Models
    class Broadcast < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Broadcast, Courier::Internal::AnyHash) }

      # The broadcast ID (bst\_ prefix).
      sig { returns(String) }
      attr_accessor :id

      # The broadcast's delivery channel.
      sig { returns(Courier::Broadcast::Channel::TaggedSymbol) }
      attr_accessor :channel

      # ISO 8601 timestamp when the broadcast was created.
      sig { returns(String) }
      attr_accessor :created_at

      # Actor that created the broadcast.
      sig { returns(String) }
      attr_accessor :created_by

      # Human-readable name.
      sig { returns(String) }
      attr_accessor :name

      # Lifecycle status of the broadcast.
      sig { returns(Courier::Broadcast::Status::TaggedSymbol) }
      attr_accessor :status

      # ISO 8601 timestamp of the last update.
      sig { returns(String) }
      attr_accessor :updated_at

      # Actor that last updated the broadcast.
      sig { returns(String) }
      attr_accessor :updated_by

      # ISO 8601 timestamp when the broadcast was archived, if archived.
      sig { returns(T.nilable(String)) }
      attr_accessor :archived_at

      # Actor that archived the broadcast, if archived.
      sig { returns(T.nilable(String)) }
      attr_accessor :archived_by

      # The delivery schedule and recipient targeting for a broadcast.
      sig { returns(T.nilable(Courier::BroadcastSchedule)) }
      attr_reader :schedule

      sig do
        params(schedule: T.nilable(Courier::BroadcastSchedule::OrHash)).void
      end
      attr_writer :schedule

      # A broadcast — a single-channel message delivered to a known set of recipients (a
      # list or audience).
      sig do
        params(
          id: String,
          channel: Courier::Broadcast::Channel::OrSymbol,
          created_at: String,
          created_by: String,
          name: String,
          status: Courier::Broadcast::Status::OrSymbol,
          updated_at: String,
          updated_by: String,
          archived_at: T.nilable(String),
          archived_by: T.nilable(String),
          schedule: T.nilable(Courier::BroadcastSchedule::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # The broadcast ID (bst\_ prefix).
        id:,
        # The broadcast's delivery channel.
        channel:,
        # ISO 8601 timestamp when the broadcast was created.
        created_at:,
        # Actor that created the broadcast.
        created_by:,
        # Human-readable name.
        name:,
        # Lifecycle status of the broadcast.
        status:,
        # ISO 8601 timestamp of the last update.
        updated_at:,
        # Actor that last updated the broadcast.
        updated_by:,
        # ISO 8601 timestamp when the broadcast was archived, if archived.
        archived_at: nil,
        # Actor that archived the broadcast, if archived.
        archived_by: nil,
        # The delivery schedule and recipient targeting for a broadcast.
        schedule: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            channel: Courier::Broadcast::Channel::TaggedSymbol,
            created_at: String,
            created_by: String,
            name: String,
            status: Courier::Broadcast::Status::TaggedSymbol,
            updated_at: String,
            updated_by: String,
            archived_at: T.nilable(String),
            archived_by: T.nilable(String),
            schedule: T.nilable(Courier::BroadcastSchedule)
          }
        )
      end
      def to_hash
      end

      # The broadcast's delivery channel.
      module Channel
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Broadcast::Channel) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EMAIL = T.let(:email, Courier::Broadcast::Channel::TaggedSymbol)
        SMS = T.let(:sms, Courier::Broadcast::Channel::TaggedSymbol)
        PUSH = T.let(:push, Courier::Broadcast::Channel::TaggedSymbol)
        INBOX = T.let(:inbox, Courier::Broadcast::Channel::TaggedSymbol)
        SLACK = T.let(:slack, Courier::Broadcast::Channel::TaggedSymbol)
        MSTEAMS = T.let(:msteams, Courier::Broadcast::Channel::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::Broadcast::Channel::TaggedSymbol])
        end
        def self.values
        end
      end

      # Lifecycle status of the broadcast.
      module Status
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::Broadcast::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DRAFT = T.let(:draft, Courier::Broadcast::Status::TaggedSymbol)
        SCHEDULED = T.let(:scheduled, Courier::Broadcast::Status::TaggedSymbol)
        SENDING = T.let(:sending, Courier::Broadcast::Status::TaggedSymbol)
        SENT = T.let(:sent, Courier::Broadcast::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Courier::Broadcast::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
