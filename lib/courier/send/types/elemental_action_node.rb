# frozen_string_literal: true

require_relative "i_alignment"
require_relative "i_action_button_style"
require_relative "locales"
require "json"

module Courier
  class Send
    # Allows the user to execute an action. Can be a button or a link.
    class ElementalActionNode
      attr_reader :content, :href, :action_id, :align, :background_color, :style, :locales, :channels, :ref, :if_,
                  :loop, :additional_properties

      # @param content [String] The text content of the action shown to the user.
      # @param href [String] The target URL of the action.
      # @param action_id [String] A unique id used to identify the action when it is executed.
      # @param align [Send::IAlignment] The alignment of the action button. Defaults to "center".
      # @param background_color [String] The background color of the action button.
      # @param style [Send::IActionButtonStyle] Defaults to `button`.
      # @param locales [Send::LOCALES] Region specific content. See [locales docs](https://www.courier.com/docs/platform/content/elemental/locales/) for more details.
      # @param channels [Array<String>]
      # @param ref [String]
      # @param if_ [String]
      # @param loop [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalActionNode]
      def initialize(content:, href:, locales:, action_id: nil, align: nil, background_color: nil, style: nil,
                     channels: nil, ref: nil, if_: nil, loop: nil, additional_properties: nil)
        # @type [String] The text content of the action shown to the user.
        @content = content
        # @type [String] The target URL of the action.
        @href = href
        # @type [String] A unique id used to identify the action when it is executed.
        @action_id = action_id
        # @type [Send::IAlignment] The alignment of the action button. Defaults to "center".
        @align = align
        # @type [String] The background color of the action button.
        @background_color = background_color
        # @type [Send::IActionButtonStyle] Defaults to `button`.
        @style = style
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

      # Deserialize a JSON object to an instance of ElementalActionNode
      #
      # @param json_object [JSON]
      # @return [Send::ElementalActionNode]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        content = struct.content
        href = struct.href
        action_id = struct.action_id
        align = struct.align
        background_color = struct.background_color
        style = struct.style
        locales = struct.locales
        channels = struct.channels
        ref = struct.ref
        if_ = struct.if
        loop = struct.loop
        new(content: content, href: href, action_id: action_id, align: align, background_color: background_color,
            style: style, locales: locales, channels: channels, ref: ref, if_: if_, loop: loop, additional_properties: struct)
      end

      # Serialize an instance of ElementalActionNode to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "content": @content,
          "href": @href,
          "action_id": @action_id,
          "align": @align,
          "background_color": @background_color,
          "style": @style,
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
        obj.href.is_a?(String) != false || raise("Passed value for field obj.href is not the expected type, validation failed.")
        obj.action_id&.is_a?(String) != false || raise("Passed value for field obj.action_id is not the expected type, validation failed.")
        obj.align&.is_a?(Send::IAlignment) != false || raise("Passed value for field obj.align is not the expected type, validation failed.")
        obj.background_color&.is_a?(String) != false || raise("Passed value for field obj.background_color is not the expected type, validation failed.")
        obj.style&.is_a?(Send::IActionButtonStyle) != false || raise("Passed value for field obj.style is not the expected type, validation failed.")
        obj.locales.is_a?(Hash) != false || raise("Passed value for field obj.locales is not the expected type, validation failed.")
        obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.loop&.is_a?(String) != false || raise("Passed value for field obj.loop is not the expected type, validation failed.")
      end
    end
  end
end
