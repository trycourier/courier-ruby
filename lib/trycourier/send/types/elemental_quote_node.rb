# frozen_string_literal: true

require_relative "i_alignment"
require_relative "text_style"
require_relative "locales"
require "json"

module Courier
  class Send
    # Renders a quote block.
    class ElementalQuoteNode
      attr_reader :content, :align, :border_color, :text_style, :locales, :channels, :ref, :if_, :loop,
                  :additional_properties

      # @param content [String] The text value of the quote.
      # @param align [I_ALIGNMENT] Alignment of the quote.
      # @param border_color [String] CSS border color property. For example, `#fff`
      # @param text_style [TEXT_STYLE]
      # @param locales [Send::LOCALES] Region specific content. See [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/) for more details.
      # @param channels [Array<String>]
      # @param ref [String]
      # @param if_ [String]
      # @param loop [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalQuoteNode]
      def initialize(content:, text_style:, locales:, align: nil, border_color: nil, channels: nil, ref: nil, if_: nil,
                     loop: nil, additional_properties: nil)
        # @type [String] The text value of the quote.
        @content = content
        # @type [I_ALIGNMENT] Alignment of the quote.
        @align = align
        # @type [String] CSS border color property. For example, `#fff`
        @border_color = border_color
        # @type [TEXT_STYLE]
        @text_style = text_style
        # @type [Send::LOCALES] Region specific content. See [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/) for more details.
        @locales = locales
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

      # Deserialize a JSON object to an instance of ElementalQuoteNode
      #
      # @param json_object [JSON]
      # @return [Send::ElementalQuoteNode]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        content = struct.content
        align = Send::I_ALIGNMENT.key(parsed_json["align"]) || parsed_json["align"]
        border_color = struct.borderColor
        text_style = Send::TEXT_STYLE.key(parsed_json["text_style"]) || parsed_json["text_style"]
        locales = struct.locales
        channels = struct.channels
        ref = struct.ref
        if_ = struct.if
        loop = struct.loop
        new(content: content, align: align, border_color: border_color, text_style: text_style, locales: locales,
            channels: channels, ref: ref, if_: if_, loop: loop, additional_properties: struct)
      end

      # Serialize an instance of ElementalQuoteNode to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "content": @content,
          "align": Send::I_ALIGNMENT[@align] || @align,
          "borderColor": @border_color,
          "text_style": Send::TEXT_STYLE[@text_style] || @text_style,
          "locales": @locales,
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
        obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.align&.is_a?(Send::I_ALIGNMENT) != false || raise("Passed value for field obj.align is not the expected type, validation failed.")
        obj.border_color&.is_a?(String) != false || raise("Passed value for field obj.border_color is not the expected type, validation failed.")
        obj.text_style.is_a?(Send::TEXT_STYLE) != false || raise("Passed value for field obj.text_style is not the expected type, validation failed.")
        obj.locales.is_a?(Hash) != false || raise("Passed value for field obj.locales is not the expected type, validation failed.")
        obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.loop&.is_a?(String) != false || raise("Passed value for field obj.loop is not the expected type, validation failed.")
      end
    end
  end
end
