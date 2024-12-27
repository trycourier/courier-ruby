# frozen_string_literal: true

require_relative "audience_member"
require "json"

module Courier
  class Audiences
    class AudienceMemberGetResponse
      attr_reader :audience_member, :additional_properties

      # @param audience_member [Audiences::AudienceMember]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Audiences::AudienceMemberGetResponse]
      def initialize(audience_member:, additional_properties: nil)
        # @type [Audiences::AudienceMember]
        @audience_member = audience_member
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AudienceMemberGetResponse
      #
      # @param json_object [JSON]
      # @return [Audiences::AudienceMemberGetResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["audienceMember"].nil?
          audience_member = nil
        else
          audience_member = parsed_json["audienceMember"].to_json
          audience_member = Audiences::AudienceMember.from_json(json_object: audience_member)
        end
        new(audience_member: audience_member, additional_properties: struct)
      end

      # Serialize an instance of AudienceMemberGetResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "audienceMember": @audience_member }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Audiences::AudienceMember.validate_raw(obj: obj.audience_member)
      end
    end
  end
end
