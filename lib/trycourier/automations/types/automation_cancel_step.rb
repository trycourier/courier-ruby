# frozen_string_literal: true

require "json"

module Courier
  class Automations
    class AutomationCancelStep
      attr_reader :action, :cancelation_token, :if_, :ref, :additional_properties

      # @param action [String]
      # @param cancelation_token [String]
      # @param if_ [String]
      # @param ref [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationCancelStep]
      def initialize(action:, cancelation_token: nil, if_: nil, ref: nil, additional_properties: nil)
        # @type [String]
        @action = action
        # @type [String]
        @cancelation_token = cancelation_token
        # @type [String]
        @if_ = if_
        # @type [String]
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationCancelStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationCancelStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        action = struct.action
        cancelation_token = struct.cancelation_token
        if_ = struct.if
        ref = struct.ref
        new(action: action, cancelation_token: cancelation_token, if_: if_, ref: ref, additional_properties: struct)
      end

      # Serialize an instance of AutomationCancelStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "action": @action, "cancelation_token": @cancelation_token, "if": @if_, "ref": @ref }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.action.is_a?(String) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
        obj.cancelation_token&.is_a?(String) != false || raise("Passed value for field obj.cancelation_token is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end
