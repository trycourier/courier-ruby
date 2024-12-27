# frozen_string_literal: true

require "json"

module Courier
  class Brands
    class BrandColors
      attr_reader :primary, :secondary, :tertiary, :additional_properties

      # @param primary [String]
      # @param secondary [String]
      # @param tertiary [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Brands::BrandColors]
      def initialize(primary: nil, secondary: nil, tertiary: nil, additional_properties: nil)
        # @type [String]
        @primary = primary
        # @type [String]
        @secondary = secondary
        # @type [String]
        @tertiary = tertiary
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandColors
      #
      # @param json_object [JSON]
      # @return [Brands::BrandColors]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        primary = struct.primary
        secondary = struct.secondary
        tertiary = struct.tertiary
        new(primary: primary, secondary: secondary, tertiary: tertiary, additional_properties: struct)
      end

      # Serialize an instance of BrandColors to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "primary": @primary, "secondary": @secondary, "tertiary": @tertiary }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.primary&.is_a?(String) != false || raise("Passed value for field obj.primary is not the expected type, validation failed.")
        obj.secondary&.is_a?(String) != false || raise("Passed value for field obj.secondary is not the expected type, validation failed.")
        obj.tertiary&.is_a?(String) != false || raise("Passed value for field obj.tertiary is not the expected type, validation failed.")
      end
    end
  end
end
