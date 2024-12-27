# frozen_string_literal: true
require "json"

module Courier
  class Automations
    class AccessorType
      attr_reader :ref, :additional_properties
      # @param ref [String] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AccessorType]
      def initialize(ref:, additional_properties: nil)
        # @type [String] 
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of AccessorType
      #
      # @param json_object [JSON] 
      # @return [Automations::AccessorType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        ref = struct.$ref
        new(ref: ref, additional_properties: struct)
      end
      # Serialize an instance of AccessorType to a JSON object
      #
      # @return [JSON]
      def to_json
        { "$ref": @ref }.to_json
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.ref.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end