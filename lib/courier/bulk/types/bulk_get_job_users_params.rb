# frozen_string_literal: true

require "json"

module Courier
  class Bulk
    class BulkGetJobUsersParams
      attr_reader :job_id, :cursor, :additional_properties

      # @param job_id [String]
      # @param cursor [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Bulk::BulkGetJobUsersParams]
      def initialize(job_id:, cursor: nil, additional_properties: nil)
        # @type [String]
        @job_id = job_id
        # @type [String]
        @cursor = cursor
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BulkGetJobUsersParams
      #
      # @param json_object [JSON]
      # @return [Bulk::BulkGetJobUsersParams]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        job_id = struct.jobId
        cursor = struct.cursor
        new(job_id: job_id, cursor: cursor, additional_properties: struct)
      end

      # Serialize an instance of BulkGetJobUsersParams to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "jobId": @job_id, "cursor": @cursor }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.job_id.is_a?(String) != false || raise("Passed value for field obj.job_id is not the expected type, validation failed.")
        obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      end
    end
  end
end
