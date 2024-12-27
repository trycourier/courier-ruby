# frozen_string_literal: true

require_relative "../../profiles/types/webhook_profile"
require "json"

module Courier
  class Send
    class WebhookRecipient
      attr_reader :webhook, :additional_properties

      # @param webhook [Profiles::WebhookProfile]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::WebhookRecipient]
      def initialize(webhook:, additional_properties: nil)
        # @type [Profiles::WebhookProfile]
        @webhook = webhook
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of WebhookRecipient
      #
      # @param json_object [JSON]
      # @return [Send::WebhookRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["webhook"].nil?
          webhook = nil
        else
          webhook = parsed_json["webhook"].to_json
          webhook = Profiles::WebhookProfile.from_json(json_object: webhook)
        end
        new(webhook: webhook, additional_properties: struct)
      end

      # Serialize an instance of WebhookRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "webhook": @webhook }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Profiles::WebhookProfile.validate_raw(obj: obj.webhook)
      end
    end
  end
end
