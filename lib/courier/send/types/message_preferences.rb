# frozen_string_literal: true

require "json"

module Courier
  class Send
    class MessagePreferences
      attr_reader :subscription_topic_id, :additional_properties

      # @param subscription_topic_id [String] The ID of the subscription topic you want to apply to the message. If this is a templated message, it will override the subscription topic if already associated
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::MessagePreferences]
      def initialize(subscription_topic_id:, additional_properties: nil)
        # @type [String] The ID of the subscription topic you want to apply to the message. If this is a templated message, it will override the subscription topic if already associated
        @subscription_topic_id = subscription_topic_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MessagePreferences
      #
      # @param json_object [JSON]
      # @return [Send::MessagePreferences]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        subscription_topic_id = struct.subscription_topic_id
        new(subscription_topic_id: subscription_topic_id, additional_properties: struct)
      end

      # Serialize an instance of MessagePreferences to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "subscription_topic_id": @subscription_topic_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.subscription_topic_id.is_a?(String) != false || raise("Passed value for field obj.subscription_topic_id is not the expected type, validation failed.")
      end
    end
  end
end
