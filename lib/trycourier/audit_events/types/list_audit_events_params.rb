# frozen_string_literal: true

require "json"

module Courier
  class AuditEvents
    class ListAuditEventsParams
      attr_reader :cursor, :additional_properties

      # @param cursor [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [AuditEvents::ListAuditEventsParams]
      def initialize(cursor: nil, additional_properties: nil)
        # @type [String]
        @cursor = cursor
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ListAuditEventsParams
      #
      # @param json_object [JSON]
      # @return [AuditEvents::ListAuditEventsParams]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        cursor = struct.cursor
        new(cursor: cursor, additional_properties: struct)
      end

      # Serialize an instance of ListAuditEventsParams to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "cursor": @cursor }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      end
    end
  end
end
