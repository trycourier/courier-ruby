# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class ProfileGetParameters
      attr_reader :recipient_id, :additional_properties

      # @param recipient_id [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::ProfileGetParameters]
      def initialize(recipient_id:, additional_properties: nil)
        # @type [String]
        @recipient_id = recipient_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ProfileGetParameters
      #
      # @param json_object [JSON]
      # @return [Profiles::ProfileGetParameters]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        recipient_id = struct.recipientId
        new(recipient_id: recipient_id, additional_properties: struct)
      end

      # Serialize an instance of ProfileGetParameters to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "recipientId": @recipient_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.recipient_id.is_a?(String) != false || raise("Passed value for field obj.recipient_id is not the expected type, validation failed.")
      end
    end
  end
end
