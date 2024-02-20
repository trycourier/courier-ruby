# frozen_string_literal: true

require_relative "snooze_rule_type"
require "json"

module Courier
  class Profiles
    class SnoozeRule
      attr_reader :type, :start, :until_, :additional_properties

      # @param type [SNOOZE_RULE_TYPE]
      # @param start [String]
      # @param until_ [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::SnoozeRule]
      def initialize(type:, start:, until_:, additional_properties: nil)
        # @type [SNOOZE_RULE_TYPE]
        @type = type
        # @type [String]
        @start = start
        # @type [String]
        @until_ = until_
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SnoozeRule
      #
      # @param json_object [JSON]
      # @return [Profiles::SnoozeRule]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = Profiles::SNOOZE_RULE_TYPE.key(parsed_json["type"]) || parsed_json["type"]
        start = struct.start
        until_ = struct.until
        new(type: type, start: start, until_: until_, additional_properties: struct)
      end

      # Serialize an instance of SnoozeRule to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "type": Profiles::SNOOZE_RULE_TYPE[@type] || @type, "start": @start, "until": @until_ }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.type.is_a?(Profiles::SNOOZE_RULE_TYPE) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.start.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
        obj.until_.is_a?(String) != false || raise("Passed value for field obj.until_ is not the expected type, validation failed.")
      end
    end
  end
end
