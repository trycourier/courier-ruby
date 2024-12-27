# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class AirshipProfileAudience
      attr_reader :named_user, :additional_properties

      # @param named_user [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::AirshipProfileAudience]
      def initialize(named_user:, additional_properties: nil)
        # @type [String]
        @named_user = named_user
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AirshipProfileAudience
      #
      # @param json_object [JSON]
      # @return [Profiles::AirshipProfileAudience]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        named_user = struct.named_user
        new(named_user: named_user, additional_properties: struct)
      end

      # Serialize an instance of AirshipProfileAudience to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "named_user": @named_user }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.named_user.is_a?(String) != false || raise("Passed value for field obj.named_user is not the expected type, validation failed.")
      end
    end
  end
end
