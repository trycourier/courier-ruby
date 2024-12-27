# frozen_string_literal: true

require_relative "inbound_bulk_message"
require_relative "bulk_job_status"
require "json"

module Courier
  class Bulk
    class JobDetails
      attr_reader :definition, :enqueued, :failures, :received, :status, :additional_properties

      # @param definition [Bulk::InboundBulkMessage]
      # @param enqueued [Integer]
      # @param failures [Integer]
      # @param received [Integer]
      # @param status [Bulk::BulkJobStatus]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Bulk::JobDetails]
      def initialize(definition:, enqueued:, failures:, received:, status:, additional_properties: nil)
        # @type [Bulk::InboundBulkMessage]
        @definition = definition
        # @type [Integer]
        @enqueued = enqueued
        # @type [Integer]
        @failures = failures
        # @type [Integer]
        @received = received
        # @type [Bulk::BulkJobStatus]
        @status = status
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of JobDetails
      #
      # @param json_object [JSON]
      # @return [Bulk::JobDetails]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["definition"].nil?
          definition = nil
        else
          definition = parsed_json["definition"].to_json
          definition = Bulk::InboundBulkMessage.from_json(json_object: definition)
        end
        enqueued = struct.enqueued
        failures = struct.failures
        received = struct.received
        status = struct.status
        new(definition: definition, enqueued: enqueued, failures: failures, received: received, status: status,
            additional_properties: struct)
      end

      # Serialize an instance of JobDetails to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "definition": @definition,
          "enqueued": @enqueued,
          "failures": @failures,
          "received": @received,
          "status": @status
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Bulk::InboundBulkMessage.validate_raw(obj: obj.definition)
        obj.enqueued.is_a?(Integer) != false || raise("Passed value for field obj.enqueued is not the expected type, validation failed.")
        obj.failures.is_a?(Integer) != false || raise("Passed value for field obj.failures is not the expected type, validation failed.")
        obj.received.is_a?(Integer) != false || raise("Passed value for field obj.received is not the expected type, validation failed.")
        obj.status.is_a?(Bulk::BulkJobStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      end
    end
  end
end
