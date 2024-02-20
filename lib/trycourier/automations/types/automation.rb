# frozen_string_literal: true

require_relative "automation_step_option"
require "json"

module Courier
  class Automations
    class Automation
      attr_reader :cancelation_token, :steps, :additional_properties

      # @param cancelation_token [String]
      # @param steps [Array<Automations::AutomationStepOption>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::Automation]
      def initialize(steps:, cancelation_token: nil, additional_properties: nil)
        # @type [String]
        @cancelation_token = cancelation_token
        # @type [Array<Automations::AutomationStepOption>]
        @steps = steps
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Automation
      #
      # @param json_object [JSON]
      # @return [Automations::Automation]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        cancelation_token = struct.cancelation_token
        steps = parsed_json["steps"]&.map do |v|
          v = v.to_json
          Automations::AutomationStepOption.from_json(json_object: v)
        end
        new(cancelation_token: cancelation_token, steps: steps, additional_properties: struct)
      end

      # Serialize an instance of Automation to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "cancelation_token": @cancelation_token, "steps": @steps }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.cancelation_token&.is_a?(String) != false || raise("Passed value for field obj.cancelation_token is not the expected type, validation failed.")
        obj.steps.is_a?(Array) != false || raise("Passed value for field obj.steps is not the expected type, validation failed.")
      end
    end
  end
end
