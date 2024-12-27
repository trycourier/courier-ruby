# frozen_string_literal: true

require "json"

module Courier
  class Send
    class ListFilter
      attr_reader :operator, :path, :value, :additional_properties

      # @param operator [String] Send to users only if they are member of the account
      # @param path [String]
      # @param value [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ListFilter]
      def initialize(operator:, path:, value:, additional_properties: nil)
        # @type [String] Send to users only if they are member of the account
        @operator = operator
        # @type [String]
        @path = path
        # @type [String]
        @value = value
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ListFilter
      #
      # @param json_object [JSON]
      # @return [Send::ListFilter]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        operator = struct.operator
        path = struct.path
        value = struct.value
        new(operator: operator, path: path, value: value, additional_properties: struct)
      end

      # Serialize an instance of ListFilter to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "operator": @operator, "path": @path, "value": @value }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.operator.is_a?(String) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
        obj.path.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
        obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
