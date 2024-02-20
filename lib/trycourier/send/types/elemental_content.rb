# frozen_string_literal: true

require_relative "elemental_node"
require "json"

module Courier
  class Send
    class ElementalContent
      attr_reader :version, :brand, :elements, :additional_properties

      # @param version [String] For example, "2022-01-01"
      # @param brand [Object]
      # @param elements [Array<Send::ElementalNode>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalContent]
      def initialize(version:, elements:, brand: nil, additional_properties: nil)
        # @type [String] For example, "2022-01-01"
        @version = version
        # @type [Object]
        @brand = brand
        # @type [Array<Send::ElementalNode>]
        @elements = elements
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ElementalContent
      #
      # @param json_object [JSON]
      # @return [Send::ElementalContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        version = struct.version
        brand = struct.brand
        elements = parsed_json["elements"]&.map do |v|
          v = v.to_json
          Send::ElementalNode.from_json(json_object: v)
        end
        new(version: version, brand: brand, elements: elements, additional_properties: struct)
      end

      # Serialize an instance of ElementalContent to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "version": @version, "brand": @brand, "elements": @elements }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.version.is_a?(String) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
        obj.brand&.is_a?(Object) != false || raise("Passed value for field obj.brand is not the expected type, validation failed.")
        obj.elements.is_a?(Array) != false || raise("Passed value for field obj.elements is not the expected type, validation failed.")
      end
    end
  end
end
