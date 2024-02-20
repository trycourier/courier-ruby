# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class SendToSlackChannel
      attr_reader :channel, :access_token, :additional_properties

      # @param channel [String]
      # @param access_token [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::SendToSlackChannel]
      def initialize(channel:, access_token:, additional_properties: nil)
        # @type [String]
        @channel = channel
        # @type [String]
        @access_token = access_token
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SendToSlackChannel
      #
      # @param json_object [JSON]
      # @return [Profiles::SendToSlackChannel]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        channel = struct.channel
        access_token = struct.access_token
        new(channel: channel, access_token: access_token, additional_properties: struct)
      end

      # Serialize an instance of SendToSlackChannel to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "channel": @channel, "access_token": @access_token }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.channel.is_a?(String) != false || raise("Passed value for field obj.channel is not the expected type, validation failed.")
        obj.access_token.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      end
    end
  end
end
