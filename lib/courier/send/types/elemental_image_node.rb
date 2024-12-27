# frozen_string_literal: true

require_relative "i_alignment"
require "json"

module Courier
  class Send
    # Used to embed an image into the notification.
    class ElementalImageNode
      attr_reader :src, :href, :align, :alt_text, :width, :channels, :ref, :if_, :loop, :additional_properties

      # @param src [String] The source of the image.
      # @param href [String] A URL to link to when the image is clicked.
      # @param align [Send::IAlignment] The alignment of the image.
      # @param alt_text [String] Alternate text for the image.
      # @param width [String] CSS width properties to apply to the image. For example, 50px
      # @param channels [Array<String>]
      # @param ref [String]
      # @param if_ [String]
      # @param loop [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalImageNode]
      def initialize(src:, href: nil, align: nil, alt_text: nil, width: nil, channels: nil, ref: nil, if_: nil,
                     loop: nil, additional_properties: nil)
        # @type [String] The source of the image.
        @src = src
        # @type [String] A URL to link to when the image is clicked.
        @href = href
        # @type [Send::IAlignment] The alignment of the image.
        @align = align
        # @type [String] Alternate text for the image.
        @alt_text = alt_text
        # @type [String] CSS width properties to apply to the image. For example, 50px
        @width = width
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

      # Deserialize a JSON object to an instance of ElementalImageNode
      #
      # @param json_object [JSON]
      # @return [Send::ElementalImageNode]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        src = struct.src
        href = struct.href
        align = struct.align
        alt_text = struct.altText
        width = struct.width
        channels = struct.channels
        ref = struct.ref
        if_ = struct.if
        loop = struct.loop
        new(src: src, href: href, align: align, alt_text: alt_text, width: width, channels: channels, ref: ref,
            if_: if_, loop: loop, additional_properties: struct)
      end

      # Serialize an instance of ElementalImageNode to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "src": @src,
          "href": @href,
          "align": @align,
          "altText": @alt_text,
          "width": @width,
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
        obj.src.is_a?(String) != false || raise("Passed value for field obj.src is not the expected type, validation failed.")
        obj.href&.is_a?(String) != false || raise("Passed value for field obj.href is not the expected type, validation failed.")
        obj.align&.is_a?(Send::IAlignment) != false || raise("Passed value for field obj.align is not the expected type, validation failed.")
        obj.alt_text&.is_a?(String) != false || raise("Passed value for field obj.alt_text is not the expected type, validation failed.")
        obj.width&.is_a?(String) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
        obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.loop&.is_a?(String) != false || raise("Passed value for field obj.loop is not the expected type, validation failed.")
      end
    end
  end
end
