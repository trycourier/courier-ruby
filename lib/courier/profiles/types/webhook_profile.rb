# frozen_string_literal: true

require_relative "webhook_method"
require_relative "webhook_authentication"
require_relative "webhook_profile_type"
require "json"

module Courier
  class Profiles
    class WebhookProfile
      attr_reader :url, :method, :headers, :authentication, :profile, :additional_properties

      # @param url [String] The URL to send the webhook request to.
      # @param method [Profiles::WebhookMethod] The HTTP method to use for the webhook request. Defaults to POST if not specified.
      # @param headers [Hash{String => String}] Custom headers to include in the webhook request.
      # @param authentication [Profiles::WebhookAuthentication] Authentication configuration for the webhook request.
      # @param profile [Profiles::WebhookProfileType] Specifies what profile information is included in the request payload. Defaults to 'limited' if not specified.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::WebhookProfile]
      def initialize(url:, method: nil, headers: nil, authentication: nil, profile: nil, additional_properties: nil)
        # @type [String] The URL to send the webhook request to.
        @url = url
        # @type [Profiles::WebhookMethod] The HTTP method to use for the webhook request. Defaults to POST if not specified.
        @method = method
        # @type [Hash{String => String}] Custom headers to include in the webhook request.
        @headers = headers
        # @type [Profiles::WebhookAuthentication] Authentication configuration for the webhook request.
        @authentication = authentication
        # @type [Profiles::WebhookProfileType] Specifies what profile information is included in the request payload. Defaults to 'limited' if not specified.
        @profile = profile
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of WebhookProfile
      #
      # @param json_object [JSON]
      # @return [Profiles::WebhookProfile]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        url = struct.url
        method = struct.method
        headers = struct.headers
        if parsed_json["authentication"].nil?
          authentication = nil
        else
          authentication = parsed_json["authentication"].to_json
          authentication = Profiles::WebhookAuthentication.from_json(json_object: authentication)
        end
        profile = struct.profile
        new(url: url, method: method, headers: headers, authentication: authentication, profile: profile,
            additional_properties: struct)
      end

      # Serialize an instance of WebhookProfile to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "url": @url,
          "method": @method,
          "headers": @headers,
          "authentication": @authentication,
          "profile": @profile
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.method&.is_a?(Profiles::WebhookMethod) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.headers&.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
        obj.authentication.nil? || Profiles::WebhookAuthentication.validate_raw(obj: obj.authentication)
        obj.profile&.is_a?(Profiles::WebhookProfileType) != false || raise("Passed value for field obj.profile is not the expected type, validation failed.")
      end
    end
  end
end
