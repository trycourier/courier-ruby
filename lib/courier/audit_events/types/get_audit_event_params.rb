# frozen_string_literal: true

require "json"

module Courier
  class AuditEvents
    class GetAuditEventParams
      attr_reader :audit_event_id, :additional_properties

      # @param audit_event_id [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [AuditEvents::GetAuditEventParams]
      def initialize(audit_event_id:, additional_properties: nil)
        # @type [String]
        @audit_event_id = audit_event_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of GetAuditEventParams
      #
      # @param json_object [JSON]
      # @return [AuditEvents::GetAuditEventParams]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        audit_event_id = struct.auditEventId
        new(audit_event_id: audit_event_id, additional_properties: struct)
      end

      # Serialize an instance of GetAuditEventParams to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "auditEventId": @audit_event_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.audit_event_id.is_a?(String) != false || raise("Passed value for field obj.audit_event_id is not the expected type, validation failed.")
      end
    end
  end
end
