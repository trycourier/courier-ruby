# frozen_string_literal: true

require "json"

module Courier
  class Send
    class InvalidListPatternRecipient
      attr_reader :user_id, :list_id, :additional_properties

      # @param user_id [String]
      # @param list_id [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::InvalidListPatternRecipient]
      def initialize(user_id:, list_id:, additional_properties: nil)
        # @type [String]
        @user_id = user_id
        # @type [String]
        @list_id = list_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of InvalidListPatternRecipient
      #
      # @param json_object [JSON]
      # @return [Send::InvalidListPatternRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        user_id = struct.user_id
        list_id = struct.list_id
        new(user_id: user_id, list_id: list_id, additional_properties: struct)
      end

      # Serialize an instance of InvalidListPatternRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "user_id": @user_id, "list_id": @list_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.user_id.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
        obj.list_id.is_a?(String) != false || raise("Passed value for field obj.list_id is not the expected type, validation failed.")
      end
    end
  end
end
