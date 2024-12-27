# frozen_string_literal: true

require "json"

module Courier
  class Audiences
    class AudienceMember
      attr_reader :added_at, :audience_id, :audience_version, :member_id, :reason, :additional_properties

      # @param added_at [String]
      # @param audience_id [String]
      # @param audience_version [Integer]
      # @param member_id [String]
      # @param reason [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Audiences::AudienceMember]
      def initialize(added_at:, audience_id:, audience_version:, member_id:, reason:, additional_properties: nil)
        # @type [String]
        @added_at = added_at
        # @type [String]
        @audience_id = audience_id
        # @type [Integer]
        @audience_version = audience_version
        # @type [String]
        @member_id = member_id
        # @type [String]
        @reason = reason
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AudienceMember
      #
      # @param json_object [JSON]
      # @return [Audiences::AudienceMember]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        added_at = struct.added_at
        audience_id = struct.audience_id
        audience_version = struct.audience_version
        member_id = struct.member_id
        reason = struct.reason
        new(added_at: added_at, audience_id: audience_id, audience_version: audience_version, member_id: member_id,
            reason: reason, additional_properties: struct)
      end

      # Serialize an instance of AudienceMember to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "added_at": @added_at,
          "audience_id": @audience_id,
          "audience_version": @audience_version,
          "member_id": @member_id,
          "reason": @reason
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.added_at.is_a?(String) != false || raise("Passed value for field obj.added_at is not the expected type, validation failed.")
        obj.audience_id.is_a?(String) != false || raise("Passed value for field obj.audience_id is not the expected type, validation failed.")
        obj.audience_version.is_a?(Integer) != false || raise("Passed value for field obj.audience_version is not the expected type, validation failed.")
        obj.member_id.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
        obj.reason.is_a?(String) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
      end
    end
  end
end
