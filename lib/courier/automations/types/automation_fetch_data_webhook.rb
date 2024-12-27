# frozen_string_literal: true

require_relative "automation_fetch_data_webhook_method"
require "json"

module Courier
  class Automations
    class AutomationFetchDataWebhook
      attr_reader :body, :headers, :params, :method, :url, :additional_properties

      # @param body [Hash{String => String}]
      # @param headers [Hash{String => String}]
      # @param params [Hash{String => String}]
      # @param method [Automations::AutomationFetchDataWebhookMethod]
      # @param url [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationFetchDataWebhook]
      def initialize(method:, url:, body: nil, headers: nil, params: nil, additional_properties: nil)
        # @type [Hash{String => String}]
        @body = body
        # @type [Hash{String => String}]
        @headers = headers
        # @type [Hash{String => String}]
        @params = params
        # @type [Automations::AutomationFetchDataWebhookMethod]
        @method = method
        # @type [String]
        @url = url
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationFetchDataWebhook
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationFetchDataWebhook]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        body = struct.body
        headers = struct.headers
        params = struct.params
        method = struct.method
        url = struct.url
        new(body: body, headers: headers, params: params, method: method, url: url, additional_properties: struct)
      end

      # Serialize an instance of AutomationFetchDataWebhook to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "body": @body, "headers": @headers, "params": @params, "method": @method, "url": @url }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.body&.is_a?(Hash) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
        obj.headers&.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
        obj.params&.is_a?(Hash) != false || raise("Passed value for field obj.params is not the expected type, validation failed.")
        obj.method.is_a?(Automations::AutomationFetchDataWebhookMethod) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      end
    end
  end
end
