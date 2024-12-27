# frozen_string_literal: true

require "json"

module Courier
  class Send
    class BrandTemplate
      attr_reader :background_color, :blocks_background_color, :enabled, :footer, :head, :header, :width,
                  :additional_properties

      # @param background_color [String]
      # @param blocks_background_color [String]
      # @param enabled [Boolean]
      # @param footer [String]
      # @param head [String]
      # @param header [String]
      # @param width [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::BrandTemplate]
      def initialize(enabled:, background_color: nil, blocks_background_color: nil, footer: nil, head: nil,
                     header: nil, width: nil, additional_properties: nil)
        # @type [String]
        @background_color = background_color
        # @type [String]
        @blocks_background_color = blocks_background_color
        # @type [Boolean]
        @enabled = enabled
        # @type [String]
        @footer = footer
        # @type [String]
        @head = head
        # @type [String]
        @header = header
        # @type [String]
        @width = width
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandTemplate
      #
      # @param json_object [JSON]
      # @return [Send::BrandTemplate]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        background_color = struct.backgroundColor
        blocks_background_color = struct.blocksBackgroundColor
        enabled = struct.enabled
        footer = struct.footer
        head = struct.head
        header = struct.header
        width = struct.width
        new(background_color: background_color, blocks_background_color: blocks_background_color, enabled: enabled,
            footer: footer, head: head, header: header, width: width, additional_properties: struct)
      end

      # Serialize an instance of BrandTemplate to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "backgroundColor": @background_color,
          "blocksBackgroundColor": @blocks_background_color,
          "enabled": @enabled,
          "footer": @footer,
          "head": @head,
          "header": @header,
          "width": @width
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.background_color&.is_a?(String) != false || raise("Passed value for field obj.background_color is not the expected type, validation failed.")
        obj.blocks_background_color&.is_a?(String) != false || raise("Passed value for field obj.blocks_background_color is not the expected type, validation failed.")
        obj.enabled.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
        obj.footer&.is_a?(String) != false || raise("Passed value for field obj.footer is not the expected type, validation failed.")
        obj.head&.is_a?(String) != false || raise("Passed value for field obj.head is not the expected type, validation failed.")
        obj.header&.is_a?(String) != false || raise("Passed value for field obj.header is not the expected type, validation failed.")
        obj.width&.is_a?(String) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
      end
    end
  end
end
