# frozen_string_literal: true

require_relative "audience_member"
require_relative "../../commons/types/paging"
require "json"

module Courier
  class Audiences
    class AudienceMemberListResponse
      attr_reader :items, :paging, :additional_properties

      # @param items [Array<Audiences::AudienceMember>]
      # @param paging [Commons::Paging]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Audiences::AudienceMemberListResponse]
      def initialize(items:, paging:, additional_properties: nil)
        # @type [Array<Audiences::AudienceMember>]
        @items = items
        # @type [Commons::Paging]
        @paging = paging
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AudienceMemberListResponse
      #
      # @param json_object [JSON]
      # @return [Audiences::AudienceMemberListResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        items = parsed_json["items"]&.map do |v|
          v = v.to_json
          Audiences::AudienceMember.from_json(json_object: v)
        end
        if parsed_json["paging"].nil?
          paging = nil
        else
          paging = parsed_json["paging"].to_json
          paging = Commons::Paging.from_json(json_object: paging)
        end
        new(items: items, paging: paging, additional_properties: struct)
      end

      # Serialize an instance of AudienceMemberListResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "items": @items, "paging": @paging }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
        Commons::Paging.validate_raw(obj: obj.paging)
      end
    end
  end
end
