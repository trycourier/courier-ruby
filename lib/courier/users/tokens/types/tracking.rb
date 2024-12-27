# frozen_string_literal: true

require "json"

module Courier
  module Users
    class Tokens
      class Tracking
        attr_reader :os_version, :ip, :lat, :long, :additional_properties

        # @param os_version [String] The operating system version
        # @param ip [String] The IP address of the device
        # @param lat [String] The latitude of the device
        # @param long [String] The longitude of the device
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Users::Tokens::Tracking]
        def initialize(os_version: nil, ip: nil, lat: nil, long: nil, additional_properties: nil)
          # @type [String] The operating system version
          @os_version = os_version
          # @type [String] The IP address of the device
          @ip = ip
          # @type [String] The latitude of the device
          @lat = lat
          # @type [String] The longitude of the device
          @long = long
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Tracking
        #
        # @param json_object [JSON]
        # @return [Users::Tokens::Tracking]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          os_version = struct.os_version
          ip = struct.ip
          lat = struct.lat
          long = struct.long
          new(os_version: os_version, ip: ip, lat: lat, long: long, additional_properties: struct)
        end

        # Serialize an instance of Tracking to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "os_version": @os_version, "ip": @ip, "lat": @lat, "long": @long }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.os_version&.is_a?(String) != false || raise("Passed value for field obj.os_version is not the expected type, validation failed.")
          obj.ip&.is_a?(String) != false || raise("Passed value for field obj.ip is not the expected type, validation failed.")
          obj.lat&.is_a?(String) != false || raise("Passed value for field obj.lat is not the expected type, validation failed.")
          obj.long&.is_a?(String) != false || raise("Passed value for field obj.long is not the expected type, validation failed.")
        end
      end
    end
  end
end
