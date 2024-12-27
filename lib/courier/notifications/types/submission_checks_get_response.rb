# frozen_string_literal: true

require_relative "check"
require "json"

module Courier
  class Notifications
    class SubmissionChecksGetResponse
      attr_reader :checks, :additional_properties

      # @param checks [Array<Notifications::Check>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::SubmissionChecksGetResponse]
      def initialize(checks:, additional_properties: nil)
        # @type [Array<Notifications::Check>]
        @checks = checks
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SubmissionChecksGetResponse
      #
      # @param json_object [JSON]
      # @return [Notifications::SubmissionChecksGetResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        checks = parsed_json["checks"]&.map do |v|
          v = v.to_json
          Notifications::Check.from_json(json_object: v)
        end
        new(checks: checks, additional_properties: struct)
      end

      # Serialize an instance of SubmissionChecksGetResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "checks": @checks }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.checks.is_a?(Array) != false || raise("Passed value for field obj.checks is not the expected type, validation failed.")
      end
    end
  end
end
