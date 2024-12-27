# frozen_string_literal: true

require "json"

module Courier
  class Automations
    class AutomationDelayStep
      attr_reader :action, :duration, :until_, :if_, :ref, :additional_properties

      # @param action [String]
      # @param duration [String] The [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations) string for how long to delay for
      # @param until_ [String] The ISO 8601 timestamp for when the delay should end
      # @param if_ [String]
      # @param ref [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationDelayStep]
      def initialize(action:, duration: nil, until_: nil, if_: nil, ref: nil, additional_properties: nil)
        # @type [String]
        @action = action
        # @type [String] The [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations) string for how long to delay for
        @duration = duration
        # @type [String] The ISO 8601 timestamp for when the delay should end
        @until_ = until_
        # @type [String]
        @if_ = if_
        # @type [String]
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationDelayStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationDelayStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        action = struct.action
        duration = struct.duration
        until_ = struct.until
        if_ = struct.if
        ref = struct.ref
        new(action: action, duration: duration, until_: until_, if_: if_, ref: ref, additional_properties: struct)
      end

      # Serialize an instance of AutomationDelayStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "action": @action, "duration": @duration, "until": @until_, "if": @if_, "ref": @ref }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.action.is_a?(String) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
        obj.duration&.is_a?(String) != false || raise("Passed value for field obj.duration is not the expected type, validation failed.")
        obj.until_&.is_a?(String) != false || raise("Passed value for field obj.until_ is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end
