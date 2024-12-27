# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class SendToSlackEmail
      attr_reader :email, :access_token, :additional_properties

      # @param email [String]
      # @param access_token [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::SendToSlackEmail]
      def initialize(email:, access_token:, additional_properties: nil)
        # @type [String]
        @email = email
        # @type [String]
        @access_token = access_token
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SendToSlackEmail
      #
      # @param json_object [JSON]
      # @return [Profiles::SendToSlackEmail]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        email = struct.email
        access_token = struct.access_token
        new(email: email, access_token: access_token, additional_properties: struct)
      end

      # Serialize an instance of SendToSlackEmail to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "email": @email, "access_token": @access_token }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
        obj.access_token.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      end
    end
  end
end
