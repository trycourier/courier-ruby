# frozen_string_literal: true

require_relative "operator"
require "json"

module Courier
  class Audiences
    # A single filter to use for filtering
    class SingleFilterConfig
      attr_reader :value, :path, :operator, :additional_properties

      # @param value [String] The value to use for filtering
      # @param path [String] The attribe name from profile whose value will be operated against the filter value
      # @param operator [Audiences::Operator] The operator to use for filtering
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Audiences::SingleFilterConfig]
      def initialize(value:, path:, operator:, additional_properties: nil)
        # @type [String] The value to use for filtering
        @value = value
        # @type [String] The attribe name from profile whose value will be operated against the filter value
        @path = path
        # @type [Audiences::Operator] The operator to use for filtering
        @operator = operator
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SingleFilterConfig
      #
      # @param json_object [JSON]
      # @return [Audiences::SingleFilterConfig]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        value = struct.value
        path = struct.path
        if parsed_json["operator"].nil?
          operator = nil
        else
          operator = parsed_json["operator"].to_json
          operator = Audiences::Operator.from_json(json_object: operator)
        end
        new(value: value, path: path, operator: operator, additional_properties: struct)
      end

      # Serialize an instance of SingleFilterConfig to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "value": @value, "path": @path, "operator": @operator }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.path.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
        Audiences::Operator.validate_raw(obj: obj.operator)
      end
    end
  end
end
