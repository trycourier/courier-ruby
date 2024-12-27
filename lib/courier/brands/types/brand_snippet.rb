# frozen_string_literal: true

require "json"

module Courier
  class Brands
    class BrandSnippet
      attr_reader :format, :name, :value, :additional_properties

      # @param format [String]
      # @param name [String]
      # @param value [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Brands::BrandSnippet]
      def initialize(format:, name:, value:, additional_properties: nil)
        # @type [String]
        @format = format
        # @type [String]
        @name = name
        # @type [String]
        @value = value
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandSnippet
      #
      # @param json_object [JSON]
      # @return [Brands::BrandSnippet]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        format = struct.format
        name = struct.name
        value = struct.value
        new(format: format, name: name, value: value, additional_properties: struct)
      end

      # Serialize an instance of BrandSnippet to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "format": @format, "name": @name, "value": @value }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.format.is_a?(String) != false || raise("Passed value for field obj.format is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
