# frozen_string_literal: true

require_relative "brand_template_override"
require_relative "email_head"
require_relative "email_footer"
require_relative "email_header"
require "json"

module Courier
  class Send
    class BrandSettingsEmail
      attr_reader :template_override, :head, :footer, :header, :additional_properties

      # @param template_override [Send::BrandTemplateOverride]
      # @param head [Send::EmailHead]
      # @param footer [Send::EmailFooter]
      # @param header [Send::EmailHeader]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::BrandSettingsEmail]
      def initialize(template_override: nil, head: nil, footer: nil, header: nil, additional_properties: nil)
        # @type [Send::BrandTemplateOverride]
        @template_override = template_override
        # @type [Send::EmailHead]
        @head = head
        # @type [Send::EmailFooter]
        @footer = footer
        # @type [Send::EmailHeader]
        @header = header
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandSettingsEmail
      #
      # @param json_object [JSON]
      # @return [Send::BrandSettingsEmail]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["templateOverride"].nil?
          template_override = nil
        else
          template_override = parsed_json["templateOverride"].to_json
          template_override = Send::BrandTemplateOverride.from_json(json_object: template_override)
        end
        if parsed_json["head"].nil?
          head = nil
        else
          head = parsed_json["head"].to_json
          head = Send::EmailHead.from_json(json_object: head)
        end
        if parsed_json["footer"].nil?
          footer = nil
        else
          footer = parsed_json["footer"].to_json
          footer = Send::EmailFooter.from_json(json_object: footer)
        end
        if parsed_json["header"].nil?
          header = nil
        else
          header = parsed_json["header"].to_json
          header = Send::EmailHeader.from_json(json_object: header)
        end
        new(template_override: template_override, head: head, footer: footer, header: header,
            additional_properties: struct)
      end

      # Serialize an instance of BrandSettingsEmail to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "templateOverride": @template_override, "head": @head, "footer": @footer, "header": @header }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.template_override.nil? || Send::BrandTemplateOverride.validate_raw(obj: obj.template_override)
        obj.head.nil? || Send::EmailHead.validate_raw(obj: obj.head)
        obj.footer.nil? || Send::EmailFooter.validate_raw(obj: obj.footer)
        obj.header.nil? || Send::EmailHeader.validate_raw(obj: obj.header)
      end
    end
  end
end
