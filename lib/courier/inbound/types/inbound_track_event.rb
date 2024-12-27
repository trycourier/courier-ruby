# frozen_string_literal: true

require "json"

module Courier
  class Inbound
    class InboundTrackEvent
      attr_reader :event, :message_id, :properties, :type, :user_id, :additional_properties

      # @param event [String] A descriptive name of the event. This name will appear as a trigger in the Courier Automation Trigger node.
      # @param message_id [String] A required unique identifier that will be used to de-duplicate requests. If not unique, will respond with 409 Conflict status
      # @param properties [Hash{String => String}]
      # @param type [String]
      # @param user_id [String] The user id assocatiated with the track
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Inbound::InboundTrackEvent]
      def initialize(event:, message_id:, properties:, type:, user_id: nil, additional_properties: nil)
        # @type [String] A descriptive name of the event. This name will appear as a trigger in the Courier Automation Trigger node.
        @event = event
        # @type [String] A required unique identifier that will be used to de-duplicate requests. If not unique, will respond with 409 Conflict status
        @message_id = message_id
        # @type [Hash{String => String}]
        @properties = properties
        # @type [String]
        @type = type
        # @type [String] The user id assocatiated with the track
        @user_id = user_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of InboundTrackEvent
      #
      # @param json_object [JSON]
      # @return [Inbound::InboundTrackEvent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        event = struct.event
        message_id = struct.messageId
        properties = struct.properties
        type = struct.type
        user_id = struct.userId
        new(event: event, message_id: message_id, properties: properties, type: type, user_id: user_id,
            additional_properties: struct)
      end

      # Serialize an instance of InboundTrackEvent to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "event": @event,
          "messageId": @message_id,
          "properties": @properties,
          "type": @type,
          "userId": @user_id
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.event.is_a?(String) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
        obj.message_id.is_a?(String) != false || raise("Passed value for field obj.message_id is not the expected type, validation failed.")
        obj.properties.is_a?(Hash) != false || raise("Passed value for field obj.properties is not the expected type, validation failed.")
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.user_id&.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
      end
    end
  end
end
