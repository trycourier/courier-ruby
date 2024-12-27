# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class SendToChannel
      attr_reader :channel_id, :additional_properties

      # @param channel_id [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::SendToChannel]
      def initialize(channel_id:, additional_properties: nil)
        # @type [String]
        @channel_id = channel_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SendToChannel
      #
      # @param json_object [JSON]
      # @return [Profiles::SendToChannel]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        channel_id = struct.channel_id
        new(channel_id: channel_id, additional_properties: struct)
      end

      # Serialize an instance of SendToChannel to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "channel_id": @channel_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.channel_id.is_a?(String) != false || raise("Passed value for field obj.channel_id is not the expected type, validation failed.")
      end
    end
  end
end
