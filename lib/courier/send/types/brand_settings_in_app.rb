# frozen_string_literal: true

require_relative "in_app_placement"
require_relative "widget_background"
require_relative "../../brands/types/brand_colors"
require_relative "icons"
require_relative "preferences"
require "json"

module Courier
  class Send
    class BrandSettingsInApp
      attr_reader :border_radius, :disable_message_icon, :font_family, :placement, :widget_background, :colors, :icons,
                  :preferences, :additional_properties

      # @param border_radius [String]
      # @param disable_message_icon [Boolean]
      # @param font_family [String]
      # @param placement [Send::InAppPlacement]
      # @param widget_background [Send::WidgetBackground]
      # @param colors [Brands::BrandColors]
      # @param icons [Send::Icons]
      # @param preferences [Send::Preferences]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::BrandSettingsInApp]
      def initialize(widget_background:, colors:, icons:, preferences:, border_radius: nil, disable_message_icon: nil,
                     font_family: nil, placement: nil, additional_properties: nil)
        # @type [String]
        @border_radius = border_radius
        # @type [Boolean]
        @disable_message_icon = disable_message_icon
        # @type [String]
        @font_family = font_family
        # @type [Send::InAppPlacement]
        @placement = placement
        # @type [Send::WidgetBackground]
        @widget_background = widget_background
        # @type [Brands::BrandColors]
        @colors = colors
        # @type [Send::Icons]
        @icons = icons
        # @type [Send::Preferences]
        @preferences = preferences
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandSettingsInApp
      #
      # @param json_object [JSON]
      # @return [Send::BrandSettingsInApp]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        border_radius = struct.borderRadius
        disable_message_icon = struct.disableMessageIcon
        font_family = struct.fontFamily
        placement = struct.placement
        if parsed_json["widgetBackground"].nil?
          widget_background = nil
        else
          widget_background = parsed_json["widgetBackground"].to_json
          widget_background = Send::WidgetBackground.from_json(json_object: widget_background)
        end
        if parsed_json["colors"].nil?
          colors = nil
        else
          colors = parsed_json["colors"].to_json
          colors = Brands::BrandColors.from_json(json_object: colors)
        end
        if parsed_json["icons"].nil?
          icons = nil
        else
          icons = parsed_json["icons"].to_json
          icons = Send::Icons.from_json(json_object: icons)
        end
        if parsed_json["preferences"].nil?
          preferences = nil
        else
          preferences = parsed_json["preferences"].to_json
          preferences = Send::Preferences.from_json(json_object: preferences)
        end
        new(border_radius: border_radius, disable_message_icon: disable_message_icon, font_family: font_family,
            placement: placement, widget_background: widget_background, colors: colors, icons: icons, preferences: preferences, additional_properties: struct)
      end

      # Serialize an instance of BrandSettingsInApp to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "borderRadius": @border_radius,
          "disableMessageIcon": @disable_message_icon,
          "fontFamily": @font_family,
          "placement": @placement,
          "widgetBackground": @widget_background,
          "colors": @colors,
          "icons": @icons,
          "preferences": @preferences
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.border_radius&.is_a?(String) != false || raise("Passed value for field obj.border_radius is not the expected type, validation failed.")
        obj.disable_message_icon&.is_a?(Boolean) != false || raise("Passed value for field obj.disable_message_icon is not the expected type, validation failed.")
        obj.font_family&.is_a?(String) != false || raise("Passed value for field obj.font_family is not the expected type, validation failed.")
        obj.placement&.is_a?(Send::InAppPlacement) != false || raise("Passed value for field obj.placement is not the expected type, validation failed.")
        Send::WidgetBackground.validate_raw(obj: obj.widget_background)
        Brands::BrandColors.validate_raw(obj: obj.colors)
        Send::Icons.validate_raw(obj: obj.icons)
        Send::Preferences.validate_raw(obj: obj.preferences)
      end
    end
  end
end
