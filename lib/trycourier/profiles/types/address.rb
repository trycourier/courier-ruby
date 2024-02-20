# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class Address
      attr_reader :formatted, :street_address, :locality, :region, :postal_code, :country, :additional_properties

      # @param formatted [String]
      # @param street_address [String]
      # @param locality [String]
      # @param region [String]
      # @param postal_code [String]
      # @param country [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::Address]
      def initialize(formatted:, street_address:, locality:, region:, postal_code:, country:,
                     additional_properties: nil)
        # @type [String]
        @formatted = formatted
        # @type [String]
        @street_address = street_address
        # @type [String]
        @locality = locality
        # @type [String]
        @region = region
        # @type [String]
        @postal_code = postal_code
        # @type [String]
        @country = country
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Address
      #
      # @param json_object [JSON]
      # @return [Profiles::Address]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        formatted = struct.formatted
        street_address = struct.street_address
        locality = struct.locality
        region = struct.region
        postal_code = struct.postal_code
        country = struct.country
        new(formatted: formatted, street_address: street_address, locality: locality, region: region,
            postal_code: postal_code, country: country, additional_properties: struct)
      end

      # Serialize an instance of Address to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "formatted": @formatted,
          "street_address": @street_address,
          "locality": @locality,
          "region": @region,
          "postal_code": @postal_code,
          "country": @country
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.formatted.is_a?(String) != false || raise("Passed value for field obj.formatted is not the expected type, validation failed.")
        obj.street_address.is_a?(String) != false || raise("Passed value for field obj.street_address is not the expected type, validation failed.")
        obj.locality.is_a?(String) != false || raise("Passed value for field obj.locality is not the expected type, validation failed.")
        obj.region.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
        obj.postal_code.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
        obj.country.is_a?(String) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      end
    end
  end
end
