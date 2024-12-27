# frozen_string_literal: true

require_relative "subscription_topic_status"
require_relative "../../commons/types/channel_classification"
require "json"

module Courier
  class Tenants
    class SubscriptionTopic
      attr_reader :id, :status, :has_custom_routing, :custom_routing, :additional_properties

      # @param id [String] Topic ID
      # @param status [Tenants::SubscriptionTopicStatus]
      # @param has_custom_routing [Boolean] Override channel routing with custom preferences. This will override any template prefernces that are set, but a user can still customize their preferences
      # @param custom_routing [Array<Commons::ChannelClassification>] The default channels to send to this tenant when has_custom_routing is enabled
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Tenants::SubscriptionTopic]
      def initialize(id:, status:, has_custom_routing: nil, custom_routing: nil, additional_properties: nil)
        # @type [String] Topic ID
        @id = id
        # @type [Tenants::SubscriptionTopicStatus]
        @status = status
        # @type [Boolean] Override channel routing with custom preferences. This will override any template prefernces that are set, but a user can still customize their preferences
        @has_custom_routing = has_custom_routing
        # @type [Array<Commons::ChannelClassification>] The default channels to send to this tenant when has_custom_routing is enabled
        @custom_routing = custom_routing
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SubscriptionTopic
      #
      # @param json_object [JSON]
      # @return [Tenants::SubscriptionTopic]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        id = struct.id
        status = struct.status
        has_custom_routing = struct.has_custom_routing
        custom_routing = struct.custom_routing
        new(id: id, status: status, has_custom_routing: has_custom_routing, custom_routing: custom_routing,
            additional_properties: struct)
      end

      # Serialize an instance of SubscriptionTopic to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "status": @status,
          "has_custom_routing": @has_custom_routing,
          "custom_routing": @custom_routing
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.status.is_a?(Tenants::SubscriptionTopicStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.has_custom_routing&.is_a?(Boolean) != false || raise("Passed value for field obj.has_custom_routing is not the expected type, validation failed.")
        obj.custom_routing&.is_a?(Array) != false || raise("Passed value for field obj.custom_routing is not the expected type, validation failed.")
      end
    end
  end
end
