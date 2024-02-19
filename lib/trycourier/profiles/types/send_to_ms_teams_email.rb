# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class SendToMsTeamsEmail
      attr_reader :email, :tenant_id, :service_url, :additional_properties

      # @param email [String]
      # @param tenant_id [String]
      # @param service_url [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::SendToMsTeamsEmail]
      def initialize(email:, tenant_id:, service_url:, additional_properties: nil)
        # @type [String]
        @email = email
        # @type [String]
        @tenant_id = tenant_id
        # @type [String]
        @service_url = service_url
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SendToMsTeamsEmail
      #
      # @param json_object [JSON]
      # @return [Profiles::SendToMsTeamsEmail]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        email = struct.email
        tenant_id = struct.tenant_id
        service_url = struct.service_url
        new(email: email, tenant_id: tenant_id, service_url: service_url, additional_properties: struct)
      end

      # Serialize an instance of SendToMsTeamsEmail to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "email": @email, "tenant_id": @tenant_id, "service_url": @service_url }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
        obj.tenant_id.is_a?(String) != false || raise("Passed value for field obj.tenant_id is not the expected type, validation failed.")
        obj.service_url.is_a?(String) != false || raise("Passed value for field obj.service_url is not the expected type, validation failed.")
      end
    end
  end
end
