# frozen_string_literal: true

require_relative "automation_throttle_scope"
require_relative "automation_throttle_on_throttle"
require "json"

module Courier
  class Automations
    class AutomationThrottleStep
      attr_reader :action, :max_allowed, :period, :scope, :throttle_key, :should_alert, :on_throttle, :if_, :ref,
                  :additional_properties

      # @param action [String]
      # @param max_allowed [Integer] Maximum number of allowed notifications in that timeframe
      # @param period [String] Defines the throttle period which corresponds to the max_allowed. Specified as an ISO 8601 duration, https://en.wikipedia.org/wiki/ISO_8601#Durations
      # @param scope [Automations::AutomationThrottleScope]
      # @param throttle_key [String] If using scope=dynamic, provide the reference (e.g., refs.data.throttle_key) to the how the throttle should be identified
      # @param should_alert [Boolean] Value must be true
      # @param on_throttle [Automations::AutomationThrottleOnThrottle]
      # @param if_ [String]
      # @param ref [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationThrottleStep]
      def initialize(action:, max_allowed:, period:, scope:, should_alert:, on_throttle:, throttle_key: nil, if_: nil,
                     ref: nil, additional_properties: nil)
        # @type [String]
        @action = action
        # @type [Integer] Maximum number of allowed notifications in that timeframe
        @max_allowed = max_allowed
        # @type [String] Defines the throttle period which corresponds to the max_allowed. Specified as an ISO 8601 duration, https://en.wikipedia.org/wiki/ISO_8601#Durations
        @period = period
        # @type [Automations::AutomationThrottleScope]
        @scope = scope
        # @type [String] If using scope=dynamic, provide the reference (e.g., refs.data.throttle_key) to the how the throttle should be identified
        @throttle_key = throttle_key
        # @type [Boolean] Value must be true
        @should_alert = should_alert
        # @type [Automations::AutomationThrottleOnThrottle]
        @on_throttle = on_throttle
        # @type [String]
        @if_ = if_
        # @type [String]
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationThrottleStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationThrottleStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        action = struct.action
        max_allowed = struct.max_allowed
        period = struct.period
        scope = struct.scope
        throttle_key = struct.throttle_key
        should_alert = struct.should_alert
        if parsed_json["on_throttle"].nil?
          on_throttle = nil
        else
          on_throttle = parsed_json["on_throttle"].to_json
          on_throttle = Automations::AutomationThrottleOnThrottle.from_json(json_object: on_throttle)
        end
        if_ = struct.if
        ref = struct.ref
        new(action: action, max_allowed: max_allowed, period: period, scope: scope, throttle_key: throttle_key,
            should_alert: should_alert, on_throttle: on_throttle, if_: if_, ref: ref, additional_properties: struct)
      end

      # Serialize an instance of AutomationThrottleStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "action": @action,
          "max_allowed": @max_allowed,
          "period": @period,
          "scope": @scope,
          "throttle_key": @throttle_key,
          "should_alert": @should_alert,
          "on_throttle": @on_throttle,
          "if": @if_,
          "ref": @ref
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.action.is_a?(String) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
        obj.max_allowed.is_a?(Integer) != false || raise("Passed value for field obj.max_allowed is not the expected type, validation failed.")
        obj.period.is_a?(String) != false || raise("Passed value for field obj.period is not the expected type, validation failed.")
        obj.scope.is_a?(Automations::AutomationThrottleScope) != false || raise("Passed value for field obj.scope is not the expected type, validation failed.")
        obj.throttle_key&.is_a?(String) != false || raise("Passed value for field obj.throttle_key is not the expected type, validation failed.")
        obj.should_alert.is_a?(Boolean) != false || raise("Passed value for field obj.should_alert is not the expected type, validation failed.")
        Automations::AutomationThrottleOnThrottle.validate_raw(obj: obj.on_throttle)
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end
