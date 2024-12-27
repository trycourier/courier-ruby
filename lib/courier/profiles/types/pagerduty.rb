# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class Pagerduty
      attr_reader :routing_key, :event_action, :severity, :source, :additional_properties

      # @param routing_key [String]
      # @param event_action [String]
      # @param severity [String]
      # @param source [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::Pagerduty]
      def initialize(routing_key: nil, event_action: nil, severity: nil, source: nil, additional_properties: nil)
        # @type [String]
        @routing_key = routing_key
        # @type [String]
        @event_action = event_action
        # @type [String]
        @severity = severity
        # @type [String]
        @source = source
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Pagerduty
      #
      # @param json_object [JSON]
      # @return [Profiles::Pagerduty]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        routing_key = struct.routing_key
        event_action = struct.event_action
        severity = struct.severity
        source = struct.source
        new(routing_key: routing_key, event_action: event_action, severity: severity, source: source,
            additional_properties: struct)
      end

      # Serialize an instance of Pagerduty to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "routing_key": @routing_key, "event_action": @event_action, "severity": @severity, "source": @source }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.routing_key&.is_a?(String) != false || raise("Passed value for field obj.routing_key is not the expected type, validation failed.")
        obj.event_action&.is_a?(String) != false || raise("Passed value for field obj.event_action is not the expected type, validation failed.")
        obj.severity&.is_a?(String) != false || raise("Passed value for field obj.severity is not the expected type, validation failed.")
        obj.source&.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
      end
    end
  end
end
