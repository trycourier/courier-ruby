# frozen_string_literal: true

require_relative "airship_profile_audience"
require_relative "device_type"
require "json"

module Courier
  class Profiles
    class AirshipProfile
      attr_reader :audience, :device_types, :additional_properties

      # @param audience [Profiles::AirshipProfileAudience]
      # @param device_types [Array<Profiles::DEVICE_TYPE>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::AirshipProfile]
      def initialize(audience:, device_types:, additional_properties: nil)
        # @type [Profiles::AirshipProfileAudience]
        @audience = audience
        # @type [Array<Profiles::DEVICE_TYPE>]
        @device_types = device_types
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AirshipProfile
      #
      # @param json_object [JSON]
      # @return [Profiles::AirshipProfile]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["audience"].nil?
          audience = nil
        else
          audience = parsed_json["audience"].to_json
          audience = Profiles::AirshipProfileAudience.from_json(json_object: audience)
        end
        device_types = struct.device_types
        new(audience: audience, device_types: device_types, additional_properties: struct)
      end

      # Serialize an instance of AirshipProfile to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "audience": @audience, "device_types": @device_types }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Profiles::AirshipProfileAudience.validate_raw(obj: obj.audience)
        obj.device_types.is_a?(Array) != false || raise("Passed value for field obj.device_types is not the expected type, validation failed.")
      end
    end
  end
end
