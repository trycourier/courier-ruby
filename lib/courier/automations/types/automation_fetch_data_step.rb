# frozen_string_literal: true

require_relative "automation_fetch_data_webhook"
require_relative "merge_algorithm"
require "json"

module Courier
  class Automations
    class AutomationFetchDataStep
      attr_reader :action, :webhook, :merge_strategy, :idempotency_expiry, :idempotency_key, :if_, :ref,
                  :additional_properties

      # @param action [String]
      # @param webhook [Automations::AutomationFetchDataWebhook]
      # @param merge_strategy [Automations::MergeAlgorithm]
      # @param idempotency_expiry [String]
      # @param idempotency_key [String]
      # @param if_ [String]
      # @param ref [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationFetchDataStep]
      def initialize(action:, webhook:, merge_strategy:, idempotency_expiry: nil, idempotency_key: nil, if_: nil,
                     ref: nil, additional_properties: nil)
        # @type [String]
        @action = action
        # @type [Automations::AutomationFetchDataWebhook]
        @webhook = webhook
        # @type [Automations::MergeAlgorithm]
        @merge_strategy = merge_strategy
        # @type [String]
        @idempotency_expiry = idempotency_expiry
        # @type [String]
        @idempotency_key = idempotency_key
        # @type [String]
        @if_ = if_
        # @type [String]
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationFetchDataStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationFetchDataStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        action = struct.action
        if parsed_json["webhook"].nil?
          webhook = nil
        else
          webhook = parsed_json["webhook"].to_json
          webhook = Automations::AutomationFetchDataWebhook.from_json(json_object: webhook)
        end
        merge_strategy = struct.merge_strategy
        idempotency_expiry = struct.idempotency_expiry
        idempotency_key = struct.idempotency_key
        if_ = struct.if
        ref = struct.ref
        new(action: action, webhook: webhook, merge_strategy: merge_strategy, idempotency_expiry: idempotency_expiry,
            idempotency_key: idempotency_key, if_: if_, ref: ref, additional_properties: struct)
      end

      # Serialize an instance of AutomationFetchDataStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "action": @action,
          "webhook": @webhook,
          "merge_strategy": @merge_strategy,
          "idempotency_expiry": @idempotency_expiry,
          "idempotency_key": @idempotency_key,
          "if": @if_,
          "ref": @ref
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.action.is_a?(String) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
        Automations::AutomationFetchDataWebhook.validate_raw(obj: obj.webhook)
        obj.merge_strategy.is_a?(Automations::MergeAlgorithm) != false || raise("Passed value for field obj.merge_strategy is not the expected type, validation failed.")
        obj.idempotency_expiry&.is_a?(String) != false || raise("Passed value for field obj.idempotency_expiry is not the expected type, validation failed.")
        obj.idempotency_key&.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end
