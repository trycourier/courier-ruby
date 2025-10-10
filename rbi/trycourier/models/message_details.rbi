# typed: strong

module Trycourier
  module Models
    class MessageDetails < Trycourier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Trycourier::MessageDetails, Trycourier::Internal::AnyHash)
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
      sig { returns(Trycourier::MessageDetails::Status::TaggedSymbol) }
      attr_accessor :status

      # A message describing the error that occurred.
      sig { returns(T.nilable(String)) }
      attr_accessor :error

      # The reason for the current status of the message.
      sig do
        returns(T.nilable(Trycourier::MessageDetails::Reason::TaggedSymbol))
      end
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
          status: Trycourier::MessageDetails::Status::OrSymbol,
          error: T.nilable(String),
          reason: T.nilable(Trycourier::MessageDetails::Reason::OrSymbol)
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
            status: Trycourier::MessageDetails::Status::TaggedSymbol,
            error: T.nilable(String),
            reason: T.nilable(Trycourier::MessageDetails::Reason::TaggedSymbol)
          }
        )
      end
      def to_hash
      end

      # The current status of the message.
      module Status
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::MessageDetails::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CANCELED =
          T.let(:CANCELED, Trycourier::MessageDetails::Status::TaggedSymbol)
        CLICKED =
          T.let(:CLICKED, Trycourier::MessageDetails::Status::TaggedSymbol)
        DELAYED =
          T.let(:DELAYED, Trycourier::MessageDetails::Status::TaggedSymbol)
        DELIVERED =
          T.let(:DELIVERED, Trycourier::MessageDetails::Status::TaggedSymbol)
        DIGESTED =
          T.let(:DIGESTED, Trycourier::MessageDetails::Status::TaggedSymbol)
        ENQUEUED =
          T.let(:ENQUEUED, Trycourier::MessageDetails::Status::TaggedSymbol)
        FILTERED =
          T.let(:FILTERED, Trycourier::MessageDetails::Status::TaggedSymbol)
        OPENED =
          T.let(:OPENED, Trycourier::MessageDetails::Status::TaggedSymbol)
        ROUTED =
          T.let(:ROUTED, Trycourier::MessageDetails::Status::TaggedSymbol)
        SENT = T.let(:SENT, Trycourier::MessageDetails::Status::TaggedSymbol)
        SIMULATED =
          T.let(:SIMULATED, Trycourier::MessageDetails::Status::TaggedSymbol)
        THROTTLED =
          T.let(:THROTTLED, Trycourier::MessageDetails::Status::TaggedSymbol)
        UNDELIVERABLE =
          T.let(
            :UNDELIVERABLE,
            Trycourier::MessageDetails::Status::TaggedSymbol
          )
        UNMAPPED =
          T.let(:UNMAPPED, Trycourier::MessageDetails::Status::TaggedSymbol)
        UNROUTABLE =
          T.let(:UNROUTABLE, Trycourier::MessageDetails::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::MessageDetails::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The reason for the current status of the message.
      module Reason
        extend Trycourier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Trycourier::MessageDetails::Reason) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BOUNCED =
          T.let(:BOUNCED, Trycourier::MessageDetails::Reason::TaggedSymbol)
        FAILED =
          T.let(:FAILED, Trycourier::MessageDetails::Reason::TaggedSymbol)
        FILTERED =
          T.let(:FILTERED, Trycourier::MessageDetails::Reason::TaggedSymbol)
        NO_CHANNELS =
          T.let(:NO_CHANNELS, Trycourier::MessageDetails::Reason::TaggedSymbol)
        NO_PROVIDERS =
          T.let(:NO_PROVIDERS, Trycourier::MessageDetails::Reason::TaggedSymbol)
        OPT_IN_REQUIRED =
          T.let(
            :OPT_IN_REQUIRED,
            Trycourier::MessageDetails::Reason::TaggedSymbol
          )
        PROVIDER_ERROR =
          T.let(
            :PROVIDER_ERROR,
            Trycourier::MessageDetails::Reason::TaggedSymbol
          )
        UNPUBLISHED =
          T.let(:UNPUBLISHED, Trycourier::MessageDetails::Reason::TaggedSymbol)
        UNSUBSCRIBED =
          T.let(:UNSUBSCRIBED, Trycourier::MessageDetails::Reason::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Trycourier::MessageDetails::Reason::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
