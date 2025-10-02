# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Messages#cancel
    class MessageDetails < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   A unique identifier associated with the message you wish to retrieve (results
      #   from a send).
      #
      #   @return [String]
      required :id, String

      # @!attribute clicked
      #   A UTC timestamp at which the recipient clicked on a tracked link for the first
      #   time. Stored as a millisecond representation of the Unix epoch.
      #
      #   @return [Integer]
      required :clicked, Integer

      # @!attribute delivered
      #   A UTC timestamp at which the Integration provider delivered the message. Stored
      #   as a millisecond representation of the Unix epoch.
      #
      #   @return [Integer]
      required :delivered, Integer

      # @!attribute enqueued
      #   A UTC timestamp at which Courier received the message request. Stored as a
      #   millisecond representation of the Unix epoch.
      #
      #   @return [Integer]
      required :enqueued, Integer

      # @!attribute event
      #   A unique identifier associated with the event of the delivered message.
      #
      #   @return [String]
      required :event, String

      # @!attribute notification
      #   A unique identifier associated with the notification of the delivered message.
      #
      #   @return [String]
      required :notification, String

      # @!attribute opened
      #   A UTC timestamp at which the recipient opened a message for the first time.
      #   Stored as a millisecond representation of the Unix epoch.
      #
      #   @return [Integer]
      required :opened, Integer

      # @!attribute recipient
      #   A unique identifier associated with the recipient of the delivered message.
      #
      #   @return [String]
      required :recipient, String

      # @!attribute sent
      #   A UTC timestamp at which Courier passed the message to the Integration provider.
      #   Stored as a millisecond representation of the Unix epoch.
      #
      #   @return [Integer]
      required :sent, Integer

      # @!attribute status
      #   The current status of the message.
      #
      #   @return [Symbol, Courier::Models::MessageDetails::Status]
      required :status, enum: -> { Courier::MessageDetails::Status }

      # @!attribute error
      #   A message describing the error that occurred.
      #
      #   @return [String, nil]
      optional :error, String, nil?: true

      # @!attribute reason
      #   The reason for the current status of the message.
      #
      #   @return [Symbol, Courier::Models::MessageDetails::Reason, nil]
      optional :reason, enum: -> { Courier::MessageDetails::Reason }, nil?: true

      # @!method initialize(id:, clicked:, delivered:, enqueued:, event:, notification:, opened:, recipient:, sent:, status:, error: nil, reason: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::MessageDetails} for more details.
      #
      #   @param id [String] A unique identifier associated with the message you wish to retrieve (results fr
      #
      #   @param clicked [Integer] A UTC timestamp at which the recipient clicked on a tracked link for the first t
      #
      #   @param delivered [Integer] A UTC timestamp at which the Integration provider delivered the message. Stored
      #
      #   @param enqueued [Integer] A UTC timestamp at which Courier received the message request. Stored as a milli
      #
      #   @param event [String] A unique identifier associated with the event of the delivered message.
      #
      #   @param notification [String] A unique identifier associated with the notification of the delivered message.
      #
      #   @param opened [Integer] A UTC timestamp at which the recipient opened a message for the first time. Stor
      #
      #   @param recipient [String] A unique identifier associated with the recipient of the delivered message.
      #
      #   @param sent [Integer] A UTC timestamp at which Courier passed the message to the Integration provider.
      #
      #   @param status [Symbol, Courier::Models::MessageDetails::Status] The current status of the message.
      #
      #   @param error [String, nil] A message describing the error that occurred.
      #
      #   @param reason [Symbol, Courier::Models::MessageDetails::Reason, nil] The reason for the current status of the message.

      # The current status of the message.
      #
      # @see Courier::Models::MessageDetails#status
      module Status
        extend Courier::Internal::Type::Enum

        CANCELED = :CANCELED
        CLICKED = :CLICKED
        DELAYED = :DELAYED
        DELIVERED = :DELIVERED
        DIGESTED = :DIGESTED
        ENQUEUED = :ENQUEUED
        FILTERED = :FILTERED
        OPENED = :OPENED
        ROUTED = :ROUTED
        SENT = :SENT
        SIMULATED = :SIMULATED
        THROTTLED = :THROTTLED
        UNDELIVERABLE = :UNDELIVERABLE
        UNMAPPED = :UNMAPPED
        UNROUTABLE = :UNROUTABLE

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The reason for the current status of the message.
      #
      # @see Courier::Models::MessageDetails#reason
      module Reason
        extend Courier::Internal::Type::Enum

        BOUNCED = :BOUNCED
        FAILED = :FAILED
        FILTERED = :FILTERED
        NO_CHANNELS = :NO_CHANNELS
        NO_PROVIDERS = :NO_PROVIDERS
        OPT_IN_REQUIRED = :OPT_IN_REQUIRED
        PROVIDER_ERROR = :PROVIDER_ERROR
        UNPUBLISHED = :UNPUBLISHED
        UNSUBSCRIBED = :UNSUBSCRIBED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
