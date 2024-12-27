# frozen_string_literal: true

require "json"

module Courier
  class Profiles
    class SendToSlackUserId
      attr_reader :user_id, :access_token, :additional_properties

      # @param user_id [String]
      # @param access_token [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::SendToSlackUserId]
      def initialize(user_id:, access_token:, additional_properties: nil)
        # @type [String]
        @user_id = user_id
        # @type [String]
        @access_token = access_token
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SendToSlackUserId
      #
      # @param json_object [JSON]
      # @return [Profiles::SendToSlackUserId]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        user_id = struct.user_id
        access_token = struct.access_token
        new(user_id: user_id, access_token: access_token, additional_properties: struct)
      end

      # Serialize an instance of SendToSlackUserId to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "user_id": @user_id, "access_token": @access_token }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.user_id.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
        obj.access_token.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
      end
    end
  end
end
