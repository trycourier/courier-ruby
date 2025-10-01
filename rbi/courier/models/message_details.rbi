# typed: strong

module Courier
  module Models
    class MessageDetails < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::MessageDetails, Courier::Internal::AnyHash)
        end

      # A unique identifier associated with the message you wish to retrieve (results
      # from a send).
      sig { returns(String) }
      attr_accessor :id

      # A UTC timestamp at which the recipient clicked on a tracked link for the first
      # time. Stored as a millisecond representation of the Unix epoch.
      sig { returns(Integer) }
      attr_accessor :clicked

      # A UTC timestamp at which the Integration provider delivered the message. Stored
      # as a millisecond representation of the Unix epoch.
      sig { returns(Integer) }
      attr_accessor :delivered

      # A UTC timestamp at which Courier received the message request. Stored as a
      # millisecond representation of the Unix epoch.
      sig { returns(Integer) }
      attr_accessor :enqueued

      # A unique identifier associated with the event of the delivered message.
      sig { returns(String) }
      attr_accessor :event

      # A unique identifier associated with the notification of the delivered message.
      sig { returns(String) }
      attr_accessor :notification

      # A UTC timestamp at which the recipient opened a message for the first time.
      # Stored as a millisecond representation of the Unix epoch.
      sig { returns(Integer) }
      attr_accessor :opened

      # A unique identifier associated with the recipient of the delivered message.
      sig { returns(String) }
      attr_accessor :recipient

      # A UTC timestamp at which Courier passed the message to the Integration provider.
      # Stored as a millisecond representation of the Unix epoch.
      sig { returns(Integer) }
      attr_accessor :sent

      # The current status of the message.
      sig { returns(Courier::MessageDetails::Status::TaggedSymbol) }
      attr_accessor :status

      # A message describing the error that occurred.
      sig { returns(T.nilable(String)) }
      attr_accessor :error

      # The reason for the current status of the message.
      sig { returns(T.nilable(Courier::MessageDetails::Reason::TaggedSymbol)) }
      attr_accessor :reason

      sig do
        params(
          id: String,
          clicked: Integer,
          delivered: Integer,
          enqueued: Integer,
          event: String,
          notification: String,
          opened: Integer,
          recipient: String,
          sent: Integer,
          status: Courier::MessageDetails::Status::OrSymbol,
          error: T.nilable(String),
          reason: T.nilable(Courier::MessageDetails::Reason::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier associated with the message you wish to retrieve (results
        # from a send).
        id:,
        # A UTC timestamp at which the recipient clicked on a tracked link for the first
        # time. Stored as a millisecond representation of the Unix epoch.
        clicked:,
        # A UTC timestamp at which the Integration provider delivered the message. Stored
        # as a millisecond representation of the Unix epoch.
        delivered:,
        # A UTC timestamp at which Courier received the message request. Stored as a
        # millisecond representation of the Unix epoch.
        enqueued:,
        # A unique identifier associated with the event of the delivered message.
        event:,
        # A unique identifier associated with the notification of the delivered message.
        notification:,
        # A UTC timestamp at which the recipient opened a message for the first time.
        # Stored as a millisecond representation of the Unix epoch.
        opened:,
        # A unique identifier associated with the recipient of the delivered message.
        recipient:,
        # A UTC timestamp at which Courier passed the message to the Integration provider.
        # Stored as a millisecond representation of the Unix epoch.
        sent:,
        # The current status of the message.
        status:,
        # A message describing the error that occurred.
        error: nil,
        # The reason for the current status of the message.
        reason: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            clicked: Integer,
            delivered: Integer,
            enqueued: Integer,
            event: String,
            notification: String,
            opened: Integer,
            recipient: String,
            sent: Integer,
            status: Courier::MessageDetails::Status::TaggedSymbol,
            error: T.nilable(String),
            reason: T.nilable(Courier::MessageDetails::Reason::TaggedSymbol)
          }
        )
      end
      def to_hash
      end

      # The current status of the message.
      module Status
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::MessageDetails::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CANCELED =
          T.let(:CANCELED, Courier::MessageDetails::Status::TaggedSymbol)
        CLICKED = T.let(:CLICKED, Courier::MessageDetails::Status::TaggedSymbol)
        DELAYED = T.let(:DELAYED, Courier::MessageDetails::Status::TaggedSymbol)
        DELIVERED =
          T.let(:DELIVERED, Courier::MessageDetails::Status::TaggedSymbol)
        DIGESTED =
          T.let(:DIGESTED, Courier::MessageDetails::Status::TaggedSymbol)
        ENQUEUED =
          T.let(:ENQUEUED, Courier::MessageDetails::Status::TaggedSymbol)
        FILTERED =
          T.let(:FILTERED, Courier::MessageDetails::Status::TaggedSymbol)
        OPENED = T.let(:OPENED, Courier::MessageDetails::Status::TaggedSymbol)
        ROUTED = T.let(:ROUTED, Courier::MessageDetails::Status::TaggedSymbol)
        SENT = T.let(:SENT, Courier::MessageDetails::Status::TaggedSymbol)
        SIMULATED =
          T.let(:SIMULATED, Courier::MessageDetails::Status::TaggedSymbol)
        THROTTLED =
          T.let(:THROTTLED, Courier::MessageDetails::Status::TaggedSymbol)
        UNDELIVERABLE =
          T.let(:UNDELIVERABLE, Courier::MessageDetails::Status::TaggedSymbol)
        UNMAPPED =
          T.let(:UNMAPPED, Courier::MessageDetails::Status::TaggedSymbol)
        UNROUTABLE =
          T.let(:UNROUTABLE, Courier::MessageDetails::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::MessageDetails::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The reason for the current status of the message.
      module Reason
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Courier::MessageDetails::Reason) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FILTERED =
          T.let(:FILTERED, Courier::MessageDetails::Reason::TaggedSymbol)
        NO_CHANNELS =
          T.let(:NO_CHANNELS, Courier::MessageDetails::Reason::TaggedSymbol)
        NO_PROVIDERS =
          T.let(:NO_PROVIDERS, Courier::MessageDetails::Reason::TaggedSymbol)
        PROVIDER_ERROR =
          T.let(:PROVIDER_ERROR, Courier::MessageDetails::Reason::TaggedSymbol)
        UNPUBLISHED =
          T.let(:UNPUBLISHED, Courier::MessageDetails::Reason::TaggedSymbol)
        UNSUBSCRIBED =
          T.let(:UNSUBSCRIBED, Courier::MessageDetails::Reason::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Courier::MessageDetails::Reason::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
