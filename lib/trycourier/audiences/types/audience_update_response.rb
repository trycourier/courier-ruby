# frozen_string_literal: true

require_relative "audience"
require "json"

module Courier
  class Audiences
    class AudienceUpdateResponse
      attr_reader :audience, :additional_properties

      # @param audience [Audiences::Audience]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Audiences::AudienceUpdateResponse]
      def initialize(audience:, additional_properties: nil)
        # @type [Audiences::Audience]
        @audience = audience
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AudienceUpdateResponse
      #
      # @param json_object [JSON]
      # @return [Audiences::AudienceUpdateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["audience"].nil?
          audience = nil
        else
          audience = parsed_json["audience"].to_json
          audience = Audiences::Audience.from_json(json_object: audience)
        end
        new(audience: audience, additional_properties: struct)
      end

      # Serialize an instance of AudienceUpdateResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "audience": @audience }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Audiences::Audience.validate_raw(obj: obj.audience)
      end
    end
  end
end
