# frozen_string_literal: true

require_relative "default_preferences"
require "json"

module Courier
  class Tenants
    class Tenant
      attr_reader :id, :name, :parent_tenant_id, :default_preferences, :properties, :user_profile, :brand_id,
                  :additional_properties

      # @param id [String] Id of the tenant.
      # @param name [String] Name of the tenant.
      # @param parent_tenant_id [String] Tenant's parent id (if any).
      # @param default_preferences [Tenants::DefaultPreferences] Defines the preferences used for the account when the user hasn't specified their own.
      # @param properties [Hash{String => String}] Arbitrary properties accessible to a template.
      # @param user_profile [Hash{String => String}] A user profile object merged with user profile on send.
      # @param brand_id [String] Brand to be used for the account when one is not specified by the send call.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Tenants::Tenant]
      def initialize(id:, name:, parent_tenant_id: nil, default_preferences: nil, properties: nil, user_profile: nil,
                     brand_id: nil, additional_properties: nil)
        # @type [String] Id of the tenant.
        @id = id
        # @type [String] Name of the tenant.
        @name = name
        # @type [String] Tenant's parent id (if any).
        @parent_tenant_id = parent_tenant_id
        # @type [Tenants::DefaultPreferences] Defines the preferences used for the account when the user hasn't specified their own.
        @default_preferences = default_preferences
        # @type [Hash{String => String}] Arbitrary properties accessible to a template.
        @properties = properties
        # @type [Hash{String => String}] A user profile object merged with user profile on send.
        @user_profile = user_profile
        # @type [String] Brand to be used for the account when one is not specified by the send call.
        @brand_id = brand_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Tenant
      #
      # @param json_object [JSON]
      # @return [Tenants::Tenant]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        name = struct.name
        parent_tenant_id = struct.parent_tenant_id
        if parsed_json["default_preferences"].nil?
          default_preferences = nil
        else
          default_preferences = parsed_json["default_preferences"].to_json
          default_preferences = Tenants::DefaultPreferences.from_json(json_object: default_preferences)
        end
        properties = struct.properties
        user_profile = struct.user_profile
        brand_id = struct.brand_id
        new(id: id, name: name, parent_tenant_id: parent_tenant_id, default_preferences: default_preferences,
            properties: properties, user_profile: user_profile, brand_id: brand_id, additional_properties: struct)
      end

      # Serialize an instance of Tenant to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "name": @name,
          "parent_tenant_id": @parent_tenant_id,
          "default_preferences": @default_preferences,
          "properties": @properties,
          "user_profile": @user_profile,
          "brand_id": @brand_id
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.parent_tenant_id&.is_a?(String) != false || raise("Passed value for field obj.parent_tenant_id is not the expected type, validation failed.")
        obj.default_preferences.nil? || Tenants::DefaultPreferences.validate_raw(obj: obj.default_preferences)
        obj.properties&.is_a?(Hash) != false || raise("Passed value for field obj.properties is not the expected type, validation failed.")
        obj.user_profile&.is_a?(Hash) != false || raise("Passed value for field obj.user_profile is not the expected type, validation failed.")
        obj.brand_id&.is_a?(String) != false || raise("Passed value for field obj.brand_id is not the expected type, validation failed.")
      end
    end
  end
end
