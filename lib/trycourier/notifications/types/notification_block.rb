# frozen_string_literal: true

require_relative "block_type"
require_relative "notification_content"
require "json"

module Courier
  class Notifications
    class NotificationBlock
      attr_reader :alias_, :context, :id, :type, :content, :locales, :checksum, :additional_properties

      # @param alias_ [String]
      # @param context [String]
      # @param id [String]
      # @param type [BLOCK_TYPE]
      # @param content [Notifications::NotificationContent]
      # @param locales [Hash{String => String}]
      # @param checksum [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::NotificationBlock]
      def initialize(id:, type:, alias_: nil, context: nil, content: nil, locales: nil, checksum: nil,
                     additional_properties: nil)
        # @type [String]
        @alias_ = alias_
        # @type [String]
        @context = context
        # @type [String]
        @id = id
        # @type [BLOCK_TYPE]
        @type = type
        # @type [Notifications::NotificationContent]
        @content = content
        # @type [Hash{String => String}]
        @locales = locales
        # @type [String]
        @checksum = checksum
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of NotificationBlock
      #
      # @param json_object [JSON]
      # @return [Notifications::NotificationBlock]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        alias_ = struct.alias
        context = struct.context
        id = struct.id
        type = Notifications::BLOCK_TYPE.key(parsed_json["type"]) || parsed_json["type"]
        if parsed_json["content"].nil?
          content = nil
        else
          content = parsed_json["content"].to_json
          content = Notifications::NotificationContent.from_json(json_object: content)
        end
        locales = struct.locales
        checksum = struct.checksum
        new(alias_: alias_, context: context, id: id, type: type, content: content, locales: locales,
            checksum: checksum, additional_properties: struct)
      end

      # Serialize an instance of NotificationBlock to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "alias": @alias_,
          "context": @context,
          "id": @id,
          "type": Notifications::BLOCK_TYPE[@type] || @type,
          "content": @content,
          "locales": @locales,
          "checksum": @checksum
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.alias_&.is_a?(String) != false || raise("Passed value for field obj.alias_ is not the expected type, validation failed.")
        obj.context&.is_a?(String) != false || raise("Passed value for field obj.context is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.type.is_a?(Notifications::BLOCK_TYPE) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.content.nil? || Notifications::NotificationContent.validate_raw(obj: obj.content)
        obj.locales&.is_a?(Hash) != false || raise("Passed value for field obj.locales is not the expected type, validation failed.")
        obj.checksum&.is_a?(String) != false || raise("Passed value for field obj.checksum is not the expected type, validation failed.")
      end
    end
  end
end
