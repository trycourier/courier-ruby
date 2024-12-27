# frozen_string_literal: true

require_relative "check_status"
require "json"

module Courier
  class Notifications
    class BaseCheck
      attr_reader :id, :status, :type, :additional_properties

      # @param id [String]
      # @param status [Notifications::CheckStatus]
      # @param type [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::BaseCheck]
      def initialize(id:, status:, type:, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [Notifications::CheckStatus]
        @status = status
        # @type [String]
        @type = type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BaseCheck
      #
      # @param json_object [JSON]
      # @return [Notifications::BaseCheck]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        id = struct.id
        status = struct.status
        type = struct.type
        new(id: id, status: status, type: type, additional_properties: struct)
      end

      # Serialize an instance of BaseCheck to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "id": @id, "status": @status, "type": @type }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.status.is_a?(Notifications::CheckStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
