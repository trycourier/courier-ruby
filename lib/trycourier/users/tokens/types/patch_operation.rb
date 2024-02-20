# frozen_string_literal: true

require "json"

module Courier
  module Users
    class Tokens
      class PatchOperation
        attr_reader :op, :path, :value, :additional_properties

        # @param op [String] The operation to perform.
        # @param path [String] The JSON path specifying the part of the profile to operate on.
        # @param value [String] The value for the operation.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Tokens::PatchOperation]
        def initialize(op:, path:, value: nil, additional_properties: nil)
          # @type [String] The operation to perform.
          @op = op
          # @type [String] The JSON path specifying the part of the profile to operate on.
          @path = path
          # @type [String] The value for the operation.
          @value = value
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PatchOperation
        #
        # @param json_object [JSON]
        # @return [Users::Tokens::PatchOperation]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          op = struct.op
          path = struct.path
          value = struct.value
          new(op: op, path: path, value: value, additional_properties: struct)
        end

        # Serialize an instance of PatchOperation to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "op": @op, "path": @path, "value": @value }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.op.is_a?(String) != false || raise("Passed value for field obj.op is not the expected type, validation failed.")
          obj.path.is_a?(String) != false || raise("Passed value for field obj.path is not the expected type, validation failed.")
          obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        end
      end
    end
  end
end
