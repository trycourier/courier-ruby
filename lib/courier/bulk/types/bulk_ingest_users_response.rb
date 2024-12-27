# frozen_string_literal: true

require_relative "bulk_ingest_error"
require "json"

module Courier
  class Bulk
    class BulkIngestUsersResponse
      attr_reader :total, :errors, :additional_properties

      # @param total [Integer]
      # @param errors [Array<Bulk::BulkIngestError>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Bulk::BulkIngestUsersResponse]
      def initialize(total:, errors: nil, additional_properties: nil)
        # @type [Integer]
        @total = total
        # @type [Array<Bulk::BulkIngestError>]
        @errors = errors
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BulkIngestUsersResponse
      #
      # @param json_object [JSON]
      # @return [Bulk::BulkIngestUsersResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        total = struct.total
        errors = parsed_json["errors"]&.map do |v|
          v = v.to_json
          Bulk::BulkIngestError.from_json(json_object: v)
        end
        new(total: total, errors: errors, additional_properties: struct)
      end

      # Serialize an instance of BulkIngestUsersResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "total": @total, "errors": @errors }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.total.is_a?(Integer) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
        obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      end
    end
  end
end
