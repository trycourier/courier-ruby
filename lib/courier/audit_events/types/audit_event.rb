# frozen_string_literal: true

require_relative "actor"
require_relative "target"
require "json"

module Courier
  class AuditEvents
    class AuditEvent
      attr_reader :actor, :target, :audit_event_id, :source, :timestamp, :type, :additional_properties

      # @param actor [AuditEvents::Actor]
      # @param target [AuditEvents::Target]
      # @param audit_event_id [String]
      # @param source [String]
      # @param timestamp [String]
      # @param type [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [AuditEvents::AuditEvent]
      def initialize(audit_event_id:, source:, timestamp:, type:, actor: nil, target: nil, additional_properties: nil)
        # @type [AuditEvents::Actor]
        @actor = actor
        # @type [AuditEvents::Target]
        @target = target
        # @type [String]
        @audit_event_id = audit_event_id
        # @type [String]
        @source = source
        # @type [String]
        @timestamp = timestamp
        # @type [String]
        @type = type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AuditEvent
      #
      # @param json_object [JSON]
      # @return [AuditEvents::AuditEvent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["actor"].nil?
          actor = nil
        else
          actor = parsed_json["actor"].to_json
          actor = AuditEvents::Actor.from_json(json_object: actor)
        end
        if parsed_json["target"].nil?
          target = nil
        else
          target = parsed_json["target"].to_json
          target = AuditEvents::Target.from_json(json_object: target)
        end
        audit_event_id = struct.auditEventId
        source = struct.source
        timestamp = struct.timestamp
        type = struct.type
        new(actor: actor, target: target, audit_event_id: audit_event_id, source: source, timestamp: timestamp,
            type: type, additional_properties: struct)
      end

      # Serialize an instance of AuditEvent to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "actor": @actor,
          "target": @target,
          "auditEventId": @audit_event_id,
          "source": @source,
          "timestamp": @timestamp,
          "type": @type
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.actor.nil? || AuditEvents::Actor.validate_raw(obj: obj.actor)
        obj.target.nil? || AuditEvents::Target.validate_raw(obj: obj.target)
        obj.audit_event_id.is_a?(String) != false || raise("Passed value for field obj.audit_event_id is not the expected type, validation failed.")
        obj.source.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
        obj.timestamp.is_a?(String) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
