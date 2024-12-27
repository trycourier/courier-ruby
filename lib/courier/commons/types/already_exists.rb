# frozen_string_literal: true

require "json"

module Courier
  class Commons
    class AlreadyExists
      attr_reader :type, :message, :additional_properties

      # @param type [String]
      # @param message [String] A message describing the error that occurred.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::AlreadyExists]
      def initialize(type:, message:, additional_properties: nil)
        # @type [String]
        @type = type
        # @type [String] A message describing the error that occurred.
        @message = message
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AlreadyExists
      #
      # @param json_object [JSON]
      # @return [Commons::AlreadyExists]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        type = struct.type
        message = struct.message
        new(type: type, message: message, additional_properties: struct)
      end

      # Serialize an instance of AlreadyExists to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "type": @type, "message": @message }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      end
    end
  end
end
