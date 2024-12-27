# frozen_string_literal: true

require "json"

module Courier
  class Send
    # The meta element contains information describing the notification that may
    # be used by a particular channel or provider. One important field is the title
    # field which will be used as the title for channels that support it.
    class ElementalMetaNode
      attr_reader :title, :channels, :ref, :if_, :loop, :additional_properties

      # @param title [String] The title to be displayed by supported channels. For example, the email subject.
      # @param channels [Array<String>]
      # @param ref [String]
      # @param if_ [String]
      # @param loop [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalMetaNode]
      def initialize(title: nil, channels: nil, ref: nil, if_: nil, loop: nil, additional_properties: nil)
        # @type [String] The title to be displayed by supported channels. For example, the email subject.
        @title = title
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

      # Deserialize a JSON object to an instance of ElementalMetaNode
      #
      # @param json_object [JSON]
      # @return [Send::ElementalMetaNode]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        title = struct.title
        channels = struct.channels
        ref = struct.ref
        if_ = struct.if
        loop = struct.loop
        new(title: title, channels: channels, ref: ref, if_: if_, loop: loop, additional_properties: struct)
      end

      # Serialize an instance of ElementalMetaNode to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "title": @title, "channels": @channels, "ref": @ref, "if": @if_, "loop": @loop }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.loop&.is_a?(String) != false || raise("Passed value for field obj.loop is not the expected type, validation failed.")
      end
    end
  end
end
