# frozen_string_literal: true

require "json"

module Courier
  class Send
    class WidgetBackground
      attr_reader :top_color, :bottom_color, :additional_properties

      # @param top_color [String]
      # @param bottom_color [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::WidgetBackground]
      def initialize(top_color: nil, bottom_color: nil, additional_properties: nil)
        # @type [String]
        @top_color = top_color
        # @type [String]
        @bottom_color = bottom_color
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of WidgetBackground
      #
      # @param json_object [JSON]
      # @return [Send::WidgetBackground]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        top_color = struct.topColor
        bottom_color = struct.bottomColor
        new(top_color: top_color, bottom_color: bottom_color, additional_properties: struct)
      end

      # Serialize an instance of WidgetBackground to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "topColor": @top_color, "bottomColor": @bottom_color }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.top_color&.is_a?(String) != false || raise("Passed value for field obj.top_color is not the expected type, validation failed.")
        obj.bottom_color&.is_a?(String) != false || raise("Passed value for field obj.bottom_color is not the expected type, validation failed.")
      end
    end
  end
end
