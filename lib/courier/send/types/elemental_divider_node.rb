# frozen_string_literal: true

require "json"

module Courier
  class Send
    # Renders a dividing line between elements.
    class ElementalDividerNode
      attr_reader :color, :channels, :ref, :if_, :loop, :additional_properties

      # @param color [String] The CSS color to render the line with. For example, `#fff`
      # @param channels [Array<String>]
      # @param ref [String]
      # @param if_ [String]
      # @param loop [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalDividerNode]
      def initialize(color: nil, channels: nil, ref: nil, if_: nil, loop: nil, additional_properties: nil)
        # @type [String] The CSS color to render the line with. For example, `#fff`
        @color = color
        # @type [Array<String>]
        @channels = channels
        # @type [String]
        @ref = ref
        # @type [String]
        @if_ = if_
        # @type [String]
        @loop = loop
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ElementalDividerNode
      #
      # @param json_object [JSON]
      # @return [Send::ElementalDividerNode]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        color = struct.color
        channels = struct.channels
        ref = struct.ref
        if_ = struct.if
        loop = struct.loop
        new(color: color, channels: channels, ref: ref, if_: if_, loop: loop, additional_properties: struct)
      end

      # Serialize an instance of ElementalDividerNode to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "color": @color, "channels": @channels, "ref": @ref, "if": @if_, "loop": @loop }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
        obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.loop&.is_a?(String) != false || raise("Passed value for field obj.loop is not the expected type, validation failed.")
      end
    end
  end
end
