# frozen_string_literal: true

require "json"

module Courier
  class AuthTokens
    class IssueTokenResponse
      attr_reader :token, :additional_properties

      # @param token [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [AuthTokens::IssueTokenResponse]
      def initialize(token: nil, additional_properties: nil)
        # @type [String]
        @token = token
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of IssueTokenResponse
      #
      # @param json_object [JSON]
      # @return [AuthTokens::IssueTokenResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        token = struct.token
        new(token: token, additional_properties: struct)
      end

      # Serialize an instance of IssueTokenResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "token": @token }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.token&.is_a?(String) != false || raise("Passed value for field obj.token is not the expected type, validation failed.")
      end
    end
  end
end
