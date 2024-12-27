# frozen_string_literal: true
require "json"

module Courier
  class Automations
    class AutomationThrottleOnThrottle
      attr_reader :node_id, :additional_properties
      # @param node_id [String] The node to go to if the request is throttled
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationThrottleOnThrottle]
      def initialize(node_id:, additional_properties: nil)
        # @type [String] The node to go to if the request is throttled
        @node_id = node_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of AutomationThrottleOnThrottle
      #
      # @param json_object [JSON] 
      # @return [Automations::AutomationThrottleOnThrottle]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        node_id = struct.$node_id
        new(node_id: node_id, additional_properties: struct)
      end
      # Serialize an instance of AutomationThrottleOnThrottle to a JSON object
      #
      # @return [JSON]
      def to_json
        { "$node_id": @node_id }.to_json
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.node_id.is_a?(String) != false || raise("Passed value for field obj.node_id is not the expected type, validation failed.")
      end
    end
  end
end