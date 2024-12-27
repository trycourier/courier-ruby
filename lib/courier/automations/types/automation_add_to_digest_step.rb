# frozen_string_literal: true

require "json"

module Courier
  class Automations
    class AutomationAddToDigestStep
      attr_reader :action, :subscription_topic_id, :if_, :ref, :additional_properties

      # @param action [String]
      # @param subscription_topic_id [String] The subscription topic that has digests enabled
      # @param if_ [String]
      # @param ref [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationAddToDigestStep]
      def initialize(action:, subscription_topic_id:, if_: nil, ref: nil, additional_properties: nil)
        # @type [String]
        @action = action
        # @type [String] The subscription topic that has digests enabled
        @subscription_topic_id = subscription_topic_id
        # @type [String]
        @if_ = if_
        # @type [String]
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationAddToDigestStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationAddToDigestStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        action = struct.action
        subscription_topic_id = struct.subscription_topic_id
        if_ = struct.if
        ref = struct.ref
        new(action: action, subscription_topic_id: subscription_topic_id, if_: if_, ref: ref,
            additional_properties: struct)
      end

      # Serialize an instance of AutomationAddToDigestStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "action": @action, "subscription_topic_id": @subscription_topic_id, "if": @if_, "ref": @ref }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.action.is_a?(String) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
        obj.subscription_topic_id.is_a?(String) != false || raise("Passed value for field obj.subscription_topic_id is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end
