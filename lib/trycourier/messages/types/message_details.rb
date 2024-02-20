# frozen_string_literal: true

require_relative "message_status"
require_relative "reason"
require "json"

module Courier
  class Messages
    class MessageDetails
      attr_reader :id, :status, :enqueued, :sent, :delivered, :opened, :clicked, :recipient, :event, :notification,
                  :error, :reason, :additional_properties

      # @param id [String] A unique identifier associated with the message you wish to retrieve (results from a send).
      # @param status [MESSAGE_STATUS] The current status of the message.
      # @param enqueued [Integer] A UTC timestamp at which Courier received the message request. Stored as a millisecond representation of the Unix epoch.
      # @param sent [Integer] A UTC timestamp at which Courier passed the message to the Integration provider. Stored as a millisecond representation of the Unix epoch.
      # @param delivered [Integer] A UTC timestamp at which the Integration provider delivered the message. Stored as a millisecond representation of the Unix epoch.
      # @param opened [Integer] A UTC timestamp at which the recipient opened a message for the first time. Stored as a millisecond representation of the Unix epoch.
      # @param clicked [Integer] A UTC timestamp at which the recipient clicked on a tracked link for the first time. Stored as a millisecond representation of the Unix epoch.
      # @param recipient [String] A unique identifier associated with the recipient of the delivered message.
      # @param event [String] A unique identifier associated with the event of the delivered message.
      # @param notification [String] A unique identifier associated with the notification of the delivered message.
      # @param error [String] A message describing the error that occurred.
      # @param reason [REASON] The reason for the current status of the message.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Messages::MessageDetails]
      def initialize(id:, status:, enqueued:, sent:, delivered:, opened:, clicked:, recipient:, event:, notification:,
                     error: nil, reason: nil, additional_properties: nil)
        # @type [String] A unique identifier associated with the message you wish to retrieve (results from a send).
        @id = id
        # @type [MESSAGE_STATUS] The current status of the message.
        @status = status
        # @type [Integer] A UTC timestamp at which Courier received the message request. Stored as a millisecond representation of the Unix epoch.
        @enqueued = enqueued
        # @type [Integer] A UTC timestamp at which Courier passed the message to the Integration provider. Stored as a millisecond representation of the Unix epoch.
        @sent = sent
        # @type [Integer] A UTC timestamp at which the Integration provider delivered the message. Stored as a millisecond representation of the Unix epoch.
        @delivered = delivered
        # @type [Integer] A UTC timestamp at which the recipient opened a message for the first time. Stored as a millisecond representation of the Unix epoch.
        @opened = opened
        # @type [Integer] A UTC timestamp at which the recipient clicked on a tracked link for the first time. Stored as a millisecond representation of the Unix epoch.
        @clicked = clicked
        # @type [String] A unique identifier associated with the recipient of the delivered message.
        @recipient = recipient
        # @type [String] A unique identifier associated with the event of the delivered message.
        @event = event
        # @type [String] A unique identifier associated with the notification of the delivered message.
        @notification = notification
        # @type [String] A message describing the error that occurred.
        @error = error
        # @type [REASON] The reason for the current status of the message.
        @reason = reason
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MessageDetails
      #
      # @param json_object [JSON]
      # @return [Messages::MessageDetails]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        status = Messages::MESSAGE_STATUS.key(parsed_json["status"]) || parsed_json["status"]
        enqueued = struct.enqueued
        sent = struct.sent
        delivered = struct.delivered
        opened = struct.opened
        clicked = struct.clicked
        recipient = struct.recipient
        event = struct.event
        notification = struct.notification
        error = struct.error
        reason = Messages::REASON.key(parsed_json["reason"]) || parsed_json["reason"]
        new(id: id, status: status, enqueued: enqueued, sent: sent, delivered: delivered, opened: opened,
            clicked: clicked, recipient: recipient, event: event, notification: notification, error: error, reason: reason, additional_properties: struct)
      end

      # Serialize an instance of MessageDetails to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "status": Messages::MESSAGE_STATUS[@status] || @status,
          "enqueued": @enqueued,
          "sent": @sent,
          "delivered": @delivered,
          "opened": @opened,
          "clicked": @clicked,
          "recipient": @recipient,
          "event": @event,
          "notification": @notification,
          "error": @error,
          "reason": Messages::REASON[@reason] || @reason
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.status.is_a?(Messages::MESSAGE_STATUS) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.enqueued.is_a?(Integer) != false || raise("Passed value for field obj.enqueued is not the expected type, validation failed.")
        obj.sent.is_a?(Integer) != false || raise("Passed value for field obj.sent is not the expected type, validation failed.")
        obj.delivered.is_a?(Integer) != false || raise("Passed value for field obj.delivered is not the expected type, validation failed.")
        obj.opened.is_a?(Integer) != false || raise("Passed value for field obj.opened is not the expected type, validation failed.")
        obj.clicked.is_a?(Integer) != false || raise("Passed value for field obj.clicked is not the expected type, validation failed.")
        obj.recipient.is_a?(String) != false || raise("Passed value for field obj.recipient is not the expected type, validation failed.")
        obj.event.is_a?(String) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
        obj.notification.is_a?(String) != false || raise("Passed value for field obj.notification is not the expected type, validation failed.")
        obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
        obj.reason&.is_a?(Messages::REASON) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
      end
    end
  end
end
