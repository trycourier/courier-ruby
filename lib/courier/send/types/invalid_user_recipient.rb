# frozen_string_literal: true

require "json"

module Courier
  class Send
    class InvalidUserRecipient
      attr_reader :list_id, :list_pattern, :additional_properties

      # @param list_id [String]
      # @param list_pattern [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::InvalidUserRecipient]
      def initialize(list_id:, list_pattern:, additional_properties: nil)
        # @type [String]
        @list_id = list_id
        # @type [String]
        @list_pattern = list_pattern
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of InvalidUserRecipient
      #
      # @param json_object [JSON]
      # @return [Send::InvalidUserRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        list_id = struct.list_id
        list_pattern = struct.list_pattern
        new(list_id: list_id, list_pattern: list_pattern, additional_properties: struct)
      end

      # Serialize an instance of InvalidUserRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "list_id": @list_id, "list_pattern": @list_pattern }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.list_id.is_a?(String) != false || raise("Passed value for field obj.list_id is not the expected type, validation failed.")
        obj.list_pattern.is_a?(String) != false || raise("Passed value for field obj.list_pattern is not the expected type, validation failed.")
      end
    end
  end
end
