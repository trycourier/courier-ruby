# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class MsTeamsBaseProperties
      attr_reader :tenant_id, :service_url, :additional_properties

      # @param tenant_id [String]
      # @param service_url [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::MsTeamsBaseProperties]
      def initialize(tenant_id:, service_url:, additional_properties: nil)
        # @type [String]
        @tenant_id = tenant_id
        # @type [String]
        @service_url = service_url
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MsTeamsBaseProperties
      #
      # @param json_object [JSON]
      # @return [Profiles::MsTeamsBaseProperties]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        tenant_id = struct.tenant_id
        service_url = struct.service_url
        new(tenant_id: tenant_id, service_url: service_url, additional_properties: struct)
      end

      # Serialize an instance of MsTeamsBaseProperties to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "tenant_id": @tenant_id, "service_url": @service_url }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.tenant_id.is_a?(String) != false || raise("Passed value for field obj.tenant_id is not the expected type, validation failed.")
        obj.service_url.is_a?(String) != false || raise("Passed value for field obj.service_url is not the expected type, validation failed.")
      end
    end
  end
end
