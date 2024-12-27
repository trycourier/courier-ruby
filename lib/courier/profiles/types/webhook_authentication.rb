# frozen_string_literal: true

require_relative "webhook_auth_mode"
require "json"

module Courier
  class Profiles
    class WebhookAuthentication
      attr_reader :mode, :username, :password, :token, :additional_properties

      # @param mode [Profiles::WebhookAuthMode] The authentication mode to use. Defaults to 'none' if not specified.
      # @param username [String] Username for basic authentication.
      # @param password [String] Password for basic authentication.
      # @param token [String] Token for bearer authentication.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::WebhookAuthentication]
      def initialize(mode:, username: nil, password: nil, token: nil, additional_properties: nil)
        # @type [Profiles::WebhookAuthMode] The authentication mode to use. Defaults to 'none' if not specified.
        @mode = mode
        # @type [String] Username for basic authentication.
        @username = username
        # @type [String] Password for basic authentication.
        @password = password
        # @type [String] Token for bearer authentication.
        @token = token
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of WebhookAuthentication
      #
      # @param json_object [JSON]
      # @return [Profiles::WebhookAuthentication]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        mode = struct.mode
        username = struct.username
        password = struct.password
        token = struct.token
        new(mode: mode, username: username, password: password, token: token, additional_properties: struct)
      end

      # Serialize an instance of WebhookAuthentication to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "mode": @mode, "username": @username, "password": @password, "token": @token }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.mode.is_a?(Profiles::WebhookAuthMode) != false || raise("Passed value for field obj.mode is not the expected type, validation failed.")
        obj.username&.is_a?(String) != false || raise("Passed value for field obj.username is not the expected type, validation failed.")
        obj.password&.is_a?(String) != false || raise("Passed value for field obj.password is not the expected type, validation failed.")
        obj.token&.is_a?(String) != false || raise("Passed value for field obj.token is not the expected type, validation failed.")
      end
    end
  end
end
