# frozen_string_literal: true

require_relative "logo"
require "json"

module Courier
  class Send
    class EmailHeader
      attr_reader :inherit_default, :bar_color, :logo, :additional_properties

      # @param inherit_default [Boolean]
      # @param bar_color [String]
      # @param logo [Send::Logo]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::EmailHeader]
      def initialize(logo:, inherit_default: nil, bar_color: nil, additional_properties: nil)
        # @type [Boolean]
        @inherit_default = inherit_default
        # @type [String]
        @bar_color = bar_color
        # @type [Send::Logo]
        @logo = logo
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EmailHeader
      #
      # @param json_object [JSON]
      # @return [Send::EmailHeader]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        inherit_default = struct.inheritDefault
        bar_color = struct.barColor
        if parsed_json["logo"].nil?
          logo = nil
        else
          logo = parsed_json["logo"].to_json
          logo = Send::Logo.from_json(json_object: logo)
        end
        new(inherit_default: inherit_default, bar_color: bar_color, logo: logo, additional_properties: struct)
      end

      # Serialize an instance of EmailHeader to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "inheritDefault": @inherit_default, "barColor": @bar_color, "logo": @logo }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.inherit_default&.is_a?(Boolean) != false || raise("Passed value for field obj.inherit_default is not the expected type, validation failed.")
        obj.bar_color&.is_a?(String) != false || raise("Passed value for field obj.bar_color is not the expected type, validation failed.")
        Send::Logo.validate_raw(obj: obj.logo)
      end
    end
  end
end
