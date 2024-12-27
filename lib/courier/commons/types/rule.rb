# frozen_string_literal: true

require "json"

module Courier
  class Commons
    class Rule
      attr_reader :start, :until_, :additional_properties

      # @param start [String]
      # @param until_ [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::Rule]
      def initialize(until_:, start: nil, additional_properties: nil)
        # @type [String]
        @start = start
        # @type [String]
        @until_ = until_
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Rule
      #
      # @param json_object [JSON]
      # @return [Commons::Rule]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        start = struct.start
        until_ = struct.until
        new(start: start, until_: until_, additional_properties: struct)
      end

      # Serialize an instance of Rule to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "start": @start, "until": @until_ }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.start&.is_a?(String) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
        obj.until_.is_a?(String) != false || raise("Passed value for field obj.until_ is not the expected type, validation failed.")
      end
    end
  end
end
