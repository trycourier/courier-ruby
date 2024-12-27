# frozen_string_literal: true

require "json"

module Courier
  class Inbound
    class TrackAcceptedResponse
      attr_reader :message_id, :additional_properties

      # @param message_id [String] A successful call returns a `202` status code along with a `requestId` in the response body.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Inbound::TrackAcceptedResponse]
      def initialize(message_id:, additional_properties: nil)
        # @type [String] A successful call returns a `202` status code along with a `requestId` in the response body.
        @message_id = message_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of TrackAcceptedResponse
      #
      # @param json_object [JSON]
      # @return [Inbound::TrackAcceptedResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        message_id = struct.messageId
        new(message_id: message_id, additional_properties: struct)
      end

      # Serialize an instance of TrackAcceptedResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "messageId": @message_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.message_id.is_a?(String) != false || raise("Passed value for field obj.message_id is not the expected type, validation failed.")
      end
    end
  end
end
