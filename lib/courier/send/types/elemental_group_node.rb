# frozen_string_literal: true

require_relative "elemental_node"
require "json"

module Courier
  class Send
    # Allows you to group elements together. This can be useful when used in combination with "if" or "loop". See [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/) for more details.
    class ElementalGroupNode
      attr_reader :elements, :channels, :ref, :if_, :loop, :additional_properties

      # @param elements [Array<Send::ElementalNode>] Sub elements to render.
      # @param channels [Array<String>]
      # @param ref [String]
      # @param if_ [String]
      # @param loop [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalGroupNode]
      def initialize(elements:, channels: nil, ref: nil, if_: nil, loop: nil, additional_properties: nil)
        # @type [Array<Send::ElementalNode>] Sub elements to render.
        @elements = elements
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

      # Deserialize a JSON object to an instance of ElementalGroupNode
      #
      # @param json_object [JSON]
      # @return [Send::ElementalGroupNode]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        elements = parsed_json["elements"]&.map do |v|
          v = v.to_json
          Send::ElementalNode.from_json(json_object: v)
        end
        channels = struct.channels
        ref = struct.ref
        if_ = struct.if
        loop = struct.loop
        new(elements: elements, channels: channels, ref: ref, if_: if_, loop: loop, additional_properties: struct)
      end

      # Serialize an instance of ElementalGroupNode to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "elements": @elements, "channels": @channels, "ref": @ref, "if": @if_, "loop": @loop }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.elements.is_a?(Array) != false || raise("Passed value for field obj.elements is not the expected type, validation failed.")
        obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.loop&.is_a?(String) != false || raise("Passed value for field obj.loop is not the expected type, validation failed.")
      end
    end
  end
end
