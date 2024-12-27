# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class SlackBaseProperties
      attr_reader :access_token, :additional_properties

      # @param access_token [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::SlackBaseProperties]
      def initialize(access_token:, additional_properties: nil)
        # @type [String]
        @access_token = access_token
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SlackBaseProperties
      #
      # @param json_object [JSON]
      # @return [Profiles::SlackBaseProperties]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        access_token = struct.access_token
        new(access_token: access_token, additional_properties: struct)
      end

      # Serialize an instance of SlackBaseProperties to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "access_token": @access_token }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.access_token.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      end
    end
  end
end
