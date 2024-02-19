# frozen_string_literal: true

require_relative "check_status"
require "json"

module Courier
  class Notifications
    class Check
      attr_reader :updated, :id, :status, :type, :additional_properties

      # @param updated [Long]
      # @param id [String]
      # @param status [CHECK_STATUS]
      # @param type [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::Check]
      def initialize(updated:, id:, status:, type:, additional_properties: nil)
        # @type [Long]
        @updated = updated
        # @type [String]
        @id = id
        # @type [CHECK_STATUS]
        @status = status
        # @type [String]
        @type = type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Check
      #
      # @param json_object [JSON]
      # @return [Notifications::Check]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        updated = struct.updated
        id = struct.id
        status = Notifications::CHECK_STATUS.key(parsed_json["status"]) || parsed_json["status"]
        type = struct.type
        new(updated: updated, id: id, status: status, type: type, additional_properties: struct)
      end

      # Serialize an instance of Check to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "updated": @updated,
          "id": @id,
          "status": Notifications::CHECK_STATUS[@status] || @status,
          "type": @type
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.updated.is_a?(Long) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.status.is_a?(Notifications::CHECK_STATUS) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
