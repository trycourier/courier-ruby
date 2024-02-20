# frozen_string_literal: true

require_relative "message_data"
require "json"

module Courier
  class Send
    class ListPatternRecipient
      attr_reader :list_pattern, :data, :additional_properties

      # @param list_pattern [String]
      # @param data [Send::MESSAGE_DATA]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ListPatternRecipient]
      def initialize(list_pattern: nil, data: nil, additional_properties: nil)
        # @type [String]
        @list_pattern = list_pattern
        # @type [Send::MESSAGE_DATA]
        @data = data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ListPatternRecipient
      #
      # @param json_object [JSON]
      # @return [Send::ListPatternRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        list_pattern = struct.list_pattern
        data = struct.data
        new(list_pattern: list_pattern, data: data, additional_properties: struct)
      end

      # Serialize an instance of ListPatternRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "list_pattern": @list_pattern, "data": @data }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.list_pattern&.is_a?(String) != false || raise("Passed value for field obj.list_pattern is not the expected type, validation failed.")
        obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
      end
    end
  end
end
