# frozen_string_literal: true

require "json"

module Courier
  class Automations
    class AutomationStep
      attr_reader :if_, :ref, :additional_properties

      # @param if_ [String]
      # @param ref [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationStep]
      def initialize(if_: nil, ref: nil, additional_properties: nil)
        # @type [String]
        @if_ = if_
        # @type [String]
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        if_ = struct.if
        ref = struct.ref
        new(if_: if_, ref: ref, additional_properties: struct)
      end

      # Serialize an instance of AutomationStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "if": @if_, "ref": @ref }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end
