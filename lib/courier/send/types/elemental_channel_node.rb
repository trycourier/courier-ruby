# frozen_string_literal: true

require_relative "elemental_node"
require "json"

module Courier
  class Send
    # The channel element allows a notification to be customized based on which channel it is sent through.
    # For example, you may want to display a detailed message when the notification is sent through email,
    # and a more concise message in a push notification. Channel elements are only valid as top-level
    # elements; you cannot nest channel elements. If there is a channel element specified at the top-level
    # of the document, all sibling elements must be channel elements.
    # Note: As an alternative, most elements support a `channel` property. Which allows you to selectively
    # display an individual element on a per channel basis. See the
    # [control flow docs](https://www.courier.com/docs/platform/content/elemental/control-flow/) for more details.
    class ElementalChannelNode
      attr_reader :channel, :elements, :raw, :channels, :ref, :if_, :loop, :additional_properties

      # @param channel [String] The channel the contents of this element should be applied to. Can be `email`,
      #   `push`, `direct_message`, `sms` or a provider such as slack
      # @param elements [Array<Send::ElementalNode>] An array of elements to apply to the channel. If `raw` has not been
      #   specified, `elements` is `required`.
      # @param raw [Hash{String => String}] Raw data to apply to the channel. If `elements` has not been
      #   specified, `raw` is `required`.
      # @param channels [Array<String>]
      # @param ref [String]
      # @param if_ [String]
      # @param loop [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalChannelNode]
      def initialize(channel:, elements: nil, raw: nil, channels: nil, ref: nil, if_: nil, loop: nil,
                     additional_properties: nil)
        # @type [String] The channel the contents of this element should be applied to. Can be `email`,
        #   `push`, `direct_message`, `sms` or a provider such as slack
        @channel = channel
        # @type [Array<Send::ElementalNode>] An array of elements to apply to the channel. If `raw` has not been
        #   specified, `elements` is `required`.
        @elements = elements
        # @type [Hash{String => String}] Raw data to apply to the channel. If `elements` has not been
        #   specified, `raw` is `required`.
        @raw = raw
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

      # Deserialize a JSON object to an instance of ElementalChannelNode
      #
      # @param json_object [JSON]
      # @return [Send::ElementalChannelNode]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        channel = struct.channel
        elements = parsed_json["elements"]&.map do |v|
          v = v.to_json
          Send::ElementalNode.from_json(json_object: v)
        end
        raw = struct.raw
        channels = struct.channels
        ref = struct.ref
        if_ = struct.if
        loop = struct.loop
        new(channel: channel, elements: elements, raw: raw, channels: channels, ref: ref, if_: if_, loop: loop,
            additional_properties: struct)
      end

      # Serialize an instance of ElementalChannelNode to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "channel": @channel,
          "elements": @elements,
          "raw": @raw,
          "channels": @channels,
          "ref": @ref,
          "if": @if_,
          "loop": @loop
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.channel.is_a?(String) != false || raise("Passed value for field obj.channel is not the expected type, validation failed.")
        obj.elements&.is_a?(Array) != false || raise("Passed value for field obj.elements is not the expected type, validation failed.")
        obj.raw&.is_a?(Hash) != false || raise("Passed value for field obj.raw is not the expected type, validation failed.")
        obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.loop&.is_a?(String) != false || raise("Passed value for field obj.loop is not the expected type, validation failed.")
      end
    end
  end
end
