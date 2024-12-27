# frozen_string_literal: true

require_relative "job_details"
require "json"

module Courier
  class Bulk
    class BulkGetJobResponse
      attr_reader :job, :additional_properties

      # @param job [Bulk::JobDetails]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Bulk::BulkGetJobResponse]
      def initialize(job:, additional_properties: nil)
        # @type [Bulk::JobDetails]
        @job = job
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BulkGetJobResponse
      #
      # @param json_object [JSON]
      # @return [Bulk::BulkGetJobResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["job"].nil?
          job = nil
        else
          job = parsed_json["job"].to_json
          job = Bulk::JobDetails.from_json(json_object: job)
        end
        new(job: job, additional_properties: struct)
      end

      # Serialize an instance of BulkGetJobResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "job": @job }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Bulk::JobDetails.validate_raw(obj: obj.job)
      end
    end
  end
end
