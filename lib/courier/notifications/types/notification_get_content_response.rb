# frozen_string_literal: true

require_relative "notification_block"
require_relative "notification_channel"
require "json"

module Courier
  class Notifications
    class NotificationGetContentResponse
      attr_reader :blocks, :channels, :checksum, :additional_properties

      # @param blocks [Array<Notifications::NotificationBlock>]
      # @param channels [Array<Notifications::NotificationChannel>]
      # @param checksum [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::NotificationGetContentResponse]
      def initialize(blocks: nil, channels: nil, checksum: nil, additional_properties: nil)
        # @type [Array<Notifications::NotificationBlock>]
        @blocks = blocks
        # @type [Array<Notifications::NotificationChannel>]
        @channels = channels
        # @type [String]
        @checksum = checksum
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of NotificationGetContentResponse
      #
      # @param json_object [JSON]
      # @return [Notifications::NotificationGetContentResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        blocks = parsed_json["blocks"]&.map do |v|
          v = v.to_json
          Notifications::NotificationBlock.from_json(json_object: v)
        end
        channels = parsed_json["channels"]&.map do |v|
          v = v.to_json
          Notifications::NotificationChannel.from_json(json_object: v)
        end
        checksum = struct.checksum
        new(blocks: blocks, channels: channels, checksum: checksum, additional_properties: struct)
      end

      # Serialize an instance of NotificationGetContentResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "blocks": @blocks, "channels": @channels, "checksum": @checksum }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.blocks&.is_a?(Array) != false || raise("Passed value for field obj.blocks is not the expected type, validation failed.")
        obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.checksum&.is_a?(String) != false || raise("Passed value for field obj.checksum is not the expected type, validation failed.")
      end
    end
  end
end
