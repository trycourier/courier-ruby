# frozen_string_literal: true

require_relative "brand_template"
require "json"

module Courier
  class Send
    class BrandTemplateOverride
      attr_reader :mjml, :footer_background_color, :footer_full_width, :background_color, :blocks_background_color,
                  :enabled, :footer, :head, :header, :width, :additional_properties

      # @param mjml [Send::BrandTemplate]
      # @param footer_background_color [String]
      # @param footer_full_width [Boolean]
      # @param background_color [String]
      # @param blocks_background_color [String]
      # @param enabled [Boolean]
      # @param footer [String]
      # @param head [String]
      # @param header [String]
      # @param width [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::BrandTemplateOverride]
      def initialize(mjml:, enabled:, footer_background_color: nil, footer_full_width: nil, background_color: nil,
                     blocks_background_color: nil, footer: nil, head: nil, header: nil, width: nil, additional_properties: nil)
        # @type [Send::BrandTemplate]
        @mjml = mjml
        # @type [String]
        @footer_background_color = footer_background_color
        # @type [Boolean]
        @footer_full_width = footer_full_width
        # @type [String]
        @background_color = background_color
        # @type [String]
        @blocks_background_color = blocks_background_color
        # @type [Boolean]
        @enabled = enabled
        # @type [String]
        @footer = footer
        # @type [String]
        @head = head
        # @type [String]
        @header = header
        # @type [String]
        @width = width
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandTemplateOverride
      #
      # @param json_object [JSON]
      # @return [Send::BrandTemplateOverride]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["mjml"].nil?
          mjml = nil
        else
          mjml = parsed_json["mjml"].to_json
          mjml = Send::BrandTemplate.from_json(json_object: mjml)
        end
        footer_background_color = struct.footerBackgroundColor
        footer_full_width = struct.footerFullWidth
        background_color = struct.backgroundColor
        blocks_background_color = struct.blocksBackgroundColor
        enabled = struct.enabled
        footer = struct.footer
        head = struct.head
        header = struct.header
        width = struct.width
        new(mjml: mjml, footer_background_color: footer_background_color, footer_full_width: footer_full_width,
            background_color: background_color, blocks_background_color: blocks_background_color, enabled: enabled, footer: footer, head: head, header: header, width: width, additional_properties: struct)
      end

      # Serialize an instance of BrandTemplateOverride to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "mjml": @mjml,
          "footerBackgroundColor": @footer_background_color,
          "footerFullWidth": @footer_full_width,
          "backgroundColor": @background_color,
          "blocksBackgroundColor": @blocks_background_color,
          "enabled": @enabled,
          "footer": @footer,
          "head": @head,
          "header": @header,
          "width": @width
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Send::BrandTemplate.validate_raw(obj: obj.mjml)
        obj.footer_background_color&.is_a?(String) != false || raise("Passed value for field obj.footer_background_color is not the expected type, validation failed.")
        obj.footer_full_width&.is_a?(Boolean) != false || raise("Passed value for field obj.footer_full_width is not the expected type, validation failed.")
        obj.background_color&.is_a?(String) != false || raise("Passed value for field obj.background_color is not the expected type, validation failed.")
        obj.blocks_background_color&.is_a?(String) != false || raise("Passed value for field obj.blocks_background_color is not the expected type, validation failed.")
        obj.enabled.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
        obj.footer&.is_a?(String) != false || raise("Passed value for field obj.footer is not the expected type, validation failed.")
        obj.head&.is_a?(String) != false || raise("Passed value for field obj.head is not the expected type, validation failed.")
        obj.header&.is_a?(String) != false || raise("Passed value for field obj.header is not the expected type, validation failed.")
        obj.width&.is_a?(String) != false || raise("Passed value for field obj.width is not the expected type, validation failed.")
      end
    end
  end
end
