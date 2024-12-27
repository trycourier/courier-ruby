# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class DeleteListSubscriptionResponse
      attr_reader :status, :additional_properties

      # @param status [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::DeleteListSubscriptionResponse]
      def initialize(status:, additional_properties: nil)
        # @type [String]
        @status = status
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of DeleteListSubscriptionResponse
      #
      # @param json_object [JSON]
      # @return [Profiles::DeleteListSubscriptionResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        status = struct.status
        new(status: status, additional_properties: struct)
      end

      # Serialize an instance of DeleteListSubscriptionResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "status": @status }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      end
    end
  end
end
