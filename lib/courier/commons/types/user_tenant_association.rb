# frozen_string_literal: true

require "json"

module Courier
  class Commons
    class UserTenantAssociation
      attr_reader :user_id, :type, :tenant_id, :profile, :additional_properties

      # @param user_id [String] User ID for the assocation between tenant and user
      # @param type [String]
      # @param tenant_id [String] Tenant ID for the assocation between tenant and user
      # @param profile [Hash{String => String}] Additional metadata to be applied to a user profile when used in a tenant context
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::UserTenantAssociation]
      def initialize(tenant_id:, user_id: nil, type: nil, profile: nil, additional_properties: nil)
        # @type [String] User ID for the assocation between tenant and user
        @user_id = user_id
        # @type [String]
        @type = type
        # @type [String] Tenant ID for the assocation between tenant and user
        @tenant_id = tenant_id
        # @type [Hash{String => String}] Additional metadata to be applied to a user profile when used in a tenant context
        @profile = profile
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of UserTenantAssociation
      #
      # @param json_object [JSON]
      # @return [Commons::UserTenantAssociation]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        user_id = struct.user_id
        type = struct.type
        tenant_id = struct.tenant_id
        profile = struct.profile
        new(user_id: user_id, type: type, tenant_id: tenant_id, profile: profile, additional_properties: struct)
      end

      # Serialize an instance of UserTenantAssociation to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "user_id": @user_id, "type": @type, "tenant_id": @tenant_id, "profile": @profile }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.user_id&.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
        obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.tenant_id.is_a?(String) != false || raise("Passed value for field obj.tenant_id is not the expected type, validation failed.")
        obj.profile&.is_a?(Hash) != false || raise("Passed value for field obj.profile is not the expected type, validation failed.")
      end
    end
  end
end
