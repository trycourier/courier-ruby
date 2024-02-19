# frozen_string_literal: true

require "json"

module Courier
  class Send
    class MessageContext
      attr_reader :tenant_id, :additional_properties

      # @param tenant_id [String] An id of a tenant, see [tenants api docs](https://www.courier.com/docs/reference/tenants/).
      #   Will load brand, default preferences and any other base context data associated with this tenant.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::MessageContext]
      def initialize(tenant_id: nil, additional_properties: nil)
        # @type [String] An id of a tenant, see [tenants api docs](https://www.courier.com/docs/reference/tenants/).
        #   Will load brand, default preferences and any other base context data associated with this tenant.
        @tenant_id = tenant_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MessageContext
      #
      # @param json_object [JSON]
      # @return [Send::MessageContext]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        tenant_id = struct.tenant_id
        new(tenant_id: tenant_id, additional_properties: struct)
      end

      # Serialize an instance of MessageContext to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "tenant_id": @tenant_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.tenant_id&.is_a?(String) != false || raise("Passed value for field obj.tenant_id is not the expected type, validation failed.")
      end
    end
  end
end
