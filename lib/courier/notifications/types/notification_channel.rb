# frozen_string_literal: true

require_relative "notification_channel_content"
require "json"

module Courier
  class Notifications
    class NotificationChannel
      attr_reader :id, :type, :content, :locales, :checksum, :additional_properties

      # @param id [String]
      # @param type [String]
      # @param content [Notifications::NotificationChannelContent]
      # @param locales [Hash{String => String}]
      # @param checksum [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::NotificationChannel]
      def initialize(id:, type: nil, content: nil, locales: nil, checksum: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String]
        @type = type
        # @type [Notifications::NotificationChannelContent]
        @content = content
        # @type [Hash{String => String}]
        @locales = locales
        # @type [String]
        @checksum = checksum
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of NotificationChannel
      #
      # @param json_object [JSON]
      # @return [Notifications::NotificationChannel]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        type = struct.type
        if parsed_json["content"].nil?
          content = nil
        else
          content = parsed_json["content"].to_json
          content = Notifications::NotificationChannelContent.from_json(json_object: content)
        end
        locales = struct.locales
        checksum = struct.checksum
        new(id: id, type: type, content: content, locales: locales, checksum: checksum, additional_properties: struct)
      end

      # Serialize an instance of NotificationChannel to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "id": @id, "type": @type, "content": @content, "locales": @locales, "checksum": @checksum }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.content.nil? || Notifications::NotificationChannelContent.validate_raw(obj: obj.content)
        obj.locales&.is_a?(Hash) != false || raise("Passed value for field obj.locales is not the expected type, validation failed.")
        obj.checksum&.is_a?(String) != false || raise("Passed value for field obj.checksum is not the expected type, validation failed.")
      end
    end
  end
end
