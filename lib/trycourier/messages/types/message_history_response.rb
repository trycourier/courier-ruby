# frozen_string_literal: true

require_relative "message_details"
require "json"

module Courier
  class Messages
    class MessageHistoryResponse
      attr_reader :results, :additional_properties

      # @param results [Array<Messages::MessageDetails>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Messages::MessageHistoryResponse]
      def initialize(results:, additional_properties: nil)
        # @type [Array<Messages::MessageDetails>]
        @results = results
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MessageHistoryResponse
      #
      # @param json_object [JSON]
      # @return [Messages::MessageHistoryResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        results = parsed_json["results"]&.map do |v|
          v = v.to_json
          Messages::MessageDetails.from_json(json_object: v)
        end
        new(results: results, additional_properties: struct)
      end

      # Serialize an instance of MessageHistoryResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "results": @results }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      end
    end
  end
end
