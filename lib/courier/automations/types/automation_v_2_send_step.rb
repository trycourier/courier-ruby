# frozen_string_literal: true

require_relative "../../send/types/message"
require "json"

module Courier
  class Automations
    class AutomationV2SendStep
      attr_reader :action, :message, :if_, :ref, :additional_properties

      # @param action [String]
      # @param message [Send::Message]
      # @param if_ [String]
      # @param ref [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationV2SendStep]
      def initialize(action:, message:, if_: nil, ref: nil, additional_properties: nil)
        # @type [String]
        @action = action
        # @type [Send::Message]
        @message = message
        # @type [String]
        @if_ = if_
        # @type [String]
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationV2SendStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationV2SendStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        action = struct.action
        if parsed_json["message"].nil?
          message = nil
        else
          message = parsed_json["message"].to_json
          message = Send::Message.from_json(json_object: message)
        end
        if_ = struct.if
        ref = struct.ref
        new(action: action, message: message, if_: if_, ref: ref, additional_properties: struct)
      end

      # Serialize an instance of AutomationV2SendStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "action": @action, "message": @message, "if": @if_, "ref": @ref }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.action.is_a?(String) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
        Send::Message.validate_raw(obj: obj.message)
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end
