# frozen_string_literal: true

require "json"

module Courier
  class Bulk
    class BulkIngestError
      attr_reader :user, :error, :additional_properties

      # @param user [Object]
      # @param error [Object]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Bulk::BulkIngestError]
      def initialize(user:, error:, additional_properties: nil)
        # @type [Object]
        @user = user
        # @type [Object]
        @error = error
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BulkIngestError
      #
      # @param json_object [JSON]
      # @return [Bulk::BulkIngestError]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        user = struct.user
        error = struct.error
        new(user: user, error: error, additional_properties: struct)
      end

      # Serialize an instance of BulkIngestError to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "user": @user, "error": @error }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.user.is_a?(Object) != false || raise("Passed value for field obj.user is not the expected type, validation failed.")
        obj.error.is_a?(Object) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
      end
    end
  end
end
