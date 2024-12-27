# frozen_string_literal: true

require_relative "automation_add_to_batch_max_items_type"
require_relative "automation_add_to_batch_retain"
require_relative "automation_add_to_batch_scope"
require "json"

module Courier
  class Automations
    class AutomationAddToBatchStep
      attr_reader :action, :wait_period, :max_wait_period, :max_items, :retain, :scope, :batch_key, :batch_id,
                  :category_key, :if_, :ref, :additional_properties

      # @param action [String]
      # @param wait_period [String] Defines the period of inactivity before the batch is released. Specified as an [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
      # @param max_wait_period [String] Defines the maximum wait time before the batch should be released. Must be less than wait period. Maximum of 60 days. Specified as an [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
      # @param max_items [Automations::AutomationAddToBatchMaxItemsType] If specified, the batch will release as soon as this number is reached
      # @param retain [Automations::AutomationAddToBatchRetain]
      # @param scope [Automations::AutomationAddToBatchScope] Determine the scope of the batching. If user, chosen in this order: recipient, profile.user_id, data.user_id, data.userId.
      #   If dynamic, then specify where the batch_key or a reference to the batch_key
      # @param batch_key [String] If using scope=dynamic, provide the key or a reference (e.g., refs.data.batch_key)
      # @param batch_id [String]
      # @param category_key [String] Defines the field of the data object the batch is set to when complete. Defaults to `batch`
      # @param if_ [String]
      # @param ref [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationAddToBatchStep]
      def initialize(action:, wait_period:, max_wait_period:, retain:, max_items: nil, scope: nil, batch_key: nil,
                     batch_id: nil, category_key: nil, if_: nil, ref: nil, additional_properties: nil)
        # @type [String]
        @action = action
        # @type [String] Defines the period of inactivity before the batch is released. Specified as an [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
        @wait_period = wait_period
        # @type [String] Defines the maximum wait time before the batch should be released. Must be less than wait period. Maximum of 60 days. Specified as an [ISO 8601 duration](https://en.wikipedia.org/wiki/ISO_8601#Durations)
        @max_wait_period = max_wait_period
        # @type [Automations::AutomationAddToBatchMaxItemsType] If specified, the batch will release as soon as this number is reached
        @max_items = max_items
        # @type [Automations::AutomationAddToBatchRetain]
        @retain = retain
        # @type [Automations::AutomationAddToBatchScope] Determine the scope of the batching. If user, chosen in this order: recipient, profile.user_id, data.user_id, data.userId.
        #   If dynamic, then specify where the batch_key or a reference to the batch_key
        @scope = scope
        # @type [String] If using scope=dynamic, provide the key or a reference (e.g., refs.data.batch_key)
        @batch_key = batch_key
        # @type [String]
        @batch_id = batch_id
        # @type [String] Defines the field of the data object the batch is set to when complete. Defaults to `batch`
        @category_key = category_key
        # @type [String]
        @if_ = if_
        # @type [String]
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationAddToBatchStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationAddToBatchStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        action = struct.action
        wait_period = struct.wait_period
        max_wait_period = struct.max_wait_period
        if parsed_json["max_items"].nil?
          max_items = nil
        else
          max_items = parsed_json["max_items"].to_json
          max_items = Automations::AutomationAddToBatchMaxItemsType.from_json(json_object: max_items)
        end
        if parsed_json["retain"].nil?
          retain = nil
        else
          retain = parsed_json["retain"].to_json
          retain = Automations::AutomationAddToBatchRetain.from_json(json_object: retain)
        end
        scope = struct.scope
        batch_key = struct.batch_key
        batch_id = struct.batch_id
        category_key = struct.category_key
        if_ = struct.if
        ref = struct.ref
        new(action: action, wait_period: wait_period, max_wait_period: max_wait_period, max_items: max_items,
            retain: retain, scope: scope, batch_key: batch_key, batch_id: batch_id, category_key: category_key, if_: if_, ref: ref, additional_properties: struct)
      end

      # Serialize an instance of AutomationAddToBatchStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "action": @action,
          "wait_period": @wait_period,
          "max_wait_period": @max_wait_period,
          "max_items": @max_items,
          "retain": @retain,
          "scope": @scope,
          "batch_key": @batch_key,
          "batch_id": @batch_id,
          "category_key": @category_key,
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
        obj.wait_period.is_a?(String) != false || raise("Passed value for field obj.wait_period is not the expected type, validation failed.")
        obj.max_wait_period.is_a?(String) != false || raise("Passed value for field obj.max_wait_period is not the expected type, validation failed.")
        obj.max_items.nil? || Automations::AutomationAddToBatchMaxItemsType.validate_raw(obj: obj.max_items)
        Automations::AutomationAddToBatchRetain.validate_raw(obj: obj.retain)
        obj.scope&.is_a?(Automations::AutomationAddToBatchScope) != false || raise("Passed value for field obj.scope is not the expected type, validation failed.")
        obj.batch_key&.is_a?(String) != false || raise("Passed value for field obj.batch_key is not the expected type, validation failed.")
        obj.batch_id&.is_a?(String) != false || raise("Passed value for field obj.batch_id is not the expected type, validation failed.")
        obj.category_key&.is_a?(String) != false || raise("Passed value for field obj.category_key is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end
