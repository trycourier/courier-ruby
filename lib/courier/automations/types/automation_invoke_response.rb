# frozen_string_literal: true

require "json"

module Courier
  class Automations
    class AutomationInvokeResponse
      attr_reader :run_id, :additional_properties

      # @param run_id [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationInvokeResponse]
      def initialize(run_id:, additional_properties: nil)
        # @type [String]
        @run_id = run_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationInvokeResponse
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationInvokeResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        run_id = struct.runId
        new(run_id: run_id, additional_properties: struct)
      end

      # Serialize an instance of AutomationInvokeResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "runId": @run_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.run_id.is_a?(String) != false || raise("Passed value for field obj.run_id is not the expected type, validation failed.")
      end
    end
  end
end
