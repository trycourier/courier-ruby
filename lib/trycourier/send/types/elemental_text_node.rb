# frozen_string_literal: true

require_relative "text_align"
require_relative "text_style"
require_relative "locales"
require "json"

module Courier
  class Send
    # Represents a body of text to be rendered inside of the notification.
    class ElementalTextNode
      attr_reader :content, :align, :text_style, :color, :bold, :italic, :strikethrough, :underline, :locales, :format,
                  :channels, :ref, :if_, :loop, :additional_properties

      # @param content [String] The text content displayed in the notification. Either this
      #   field must be specified, or the elements field
      # @param align [TEXT_ALIGN] Text alignment.
      # @param text_style [TEXT_STYLE] Allows the text to be rendered as a heading level.
      # @param color [String] Specifies the color of text. Can be any valid css color value
      # @param bold [String] Apply bold to the text
      # @param italic [String] Apply italics to the text
      # @param strikethrough [String] Apply a strike through the text
      # @param underline [String] Apply an underline to the text
      # @param locales [Send::LOCALES] Region specific content. See [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/) for more details.
      # @param format [String]
      # @param channels [Array<String>]
      # @param ref [String]
      # @param if_ [String]
      # @param loop [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalTextNode]
      def initialize(content:, align:, text_style: nil, color: nil, bold: nil, italic: nil, strikethrough: nil,
                     underline: nil, locales: nil, format: nil, channels: nil, ref: nil, if_: nil, loop: nil, additional_properties: nil)
        # @type [String] The text content displayed in the notification. Either this
        #   field must be specified, or the elements field
        @content = content
        # @type [TEXT_ALIGN] Text alignment.
        @align = align
        # @type [TEXT_STYLE] Allows the text to be rendered as a heading level.
        @text_style = text_style
        # @type [String] Specifies the color of text. Can be any valid css color value
        @color = color
        # @type [String] Apply bold to the text
        @bold = bold
        # @type [String] Apply italics to the text
        @italic = italic
        # @type [String] Apply a strike through the text
        @strikethrough = strikethrough
        # @type [String] Apply an underline to the text
        @underline = underline
        # @type [Send::LOCALES] Region specific content. See [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/) for more details.
        @locales = locales
        # @type [String]
        @format = format
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

      # Deserialize a JSON object to an instance of ElementalTextNode
      #
      # @param json_object [JSON]
      # @return [Send::ElementalTextNode]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        content = struct.content
        align = Send::TEXT_ALIGN.key(parsed_json["align"]) || parsed_json["align"]
        text_style = Send::TEXT_STYLE.key(parsed_json["text_style"]) || parsed_json["text_style"]
        color = struct.color
        bold = struct.bold
        italic = struct.italic
        strikethrough = struct.strikethrough
        underline = struct.underline
        locales = struct.locales
        format = struct.format
        channels = struct.channels
        ref = struct.ref
        if_ = struct.if
        loop = struct.loop
        new(content: content, align: align, text_style: text_style, color: color, bold: bold, italic: italic,
            strikethrough: strikethrough, underline: underline, locales: locales, format: format, channels: channels, ref: ref, if_: if_, loop: loop, additional_properties: struct)
      end

      # Serialize an instance of ElementalTextNode to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "content": @content,
          "align": Send::TEXT_ALIGN[@align] || @align,
          "text_style": Send::TEXT_STYLE[@text_style] || @text_style,
          "color": @color,
          "bold": @bold,
          "italic": @italic,
          "strikethrough": @strikethrough,
          "underline": @underline,
          "locales": @locales,
          "format": @format,
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
        obj.align.is_a?(Send::TEXT_ALIGN) != false || raise("Passed value for field obj.align is not the expected type, validation failed.")
        obj.text_style&.is_a?(Send::TEXT_STYLE) != false || raise("Passed value for field obj.text_style is not the expected type, validation failed.")
        obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
        obj.bold&.is_a?(String) != false || raise("Passed value for field obj.bold is not the expected type, validation failed.")
        obj.italic&.is_a?(String) != false || raise("Passed value for field obj.italic is not the expected type, validation failed.")
        obj.strikethrough&.is_a?(String) != false || raise("Passed value for field obj.strikethrough is not the expected type, validation failed.")
        obj.underline&.is_a?(String) != false || raise("Passed value for field obj.underline is not the expected type, validation failed.")
        obj.locales&.is_a?(Hash) != false || raise("Passed value for field obj.locales is not the expected type, validation failed.")
        obj.format&.is_a?(String) != false || raise("Passed value for field obj.format is not the expected type, validation failed.")
        obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.loop&.is_a?(String) != false || raise("Passed value for field obj.loop is not the expected type, validation failed.")
      end
    end
  end
end
