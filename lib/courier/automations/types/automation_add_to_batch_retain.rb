# frozen_string_literal: true

require_relative "automation_add_to_batch_retain_type"
require "json"

module Courier
  class Automations
    # Defines what items should be retained and passed along to the next steps when the batch is released
    class AutomationAddToBatchRetain
      attr_reader :type, :count, :sort_key, :additional_properties

      # @param type [Automations::AutomationAddToBatchRetainType] Keep N number of notifications based on the type. First/Last N based on notification received.
      #   highest/lowest based on a scoring key providing in the data accessed by sort_key
      # @param count [Integer] The number of records to keep in batch. Default is 10 and only configurable by requesting from support.
      #   When configurable minimum is 2 and maximum is 100.
      # @param sort_key [String] Defines the data value data[sort_key] that is used to sort the stored items. Required when type is set to highest or lowest.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationAddToBatchRetain]
      def initialize(type:, count:, sort_key: nil, additional_properties: nil)
        # @type [Automations::AutomationAddToBatchRetainType] Keep N number of notifications based on the type. First/Last N based on notification received.
        #   highest/lowest based on a scoring key providing in the data accessed by sort_key
        @type = type
        # @type [Integer] The number of records to keep in batch. Default is 10 and only configurable by requesting from support.
        #   When configurable minimum is 2 and maximum is 100.
        @count = count
        # @type [String] Defines the data value data[sort_key] that is used to sort the stored items. Required when type is set to highest or lowest.
        @sort_key = sort_key
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationAddToBatchRetain
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationAddToBatchRetain]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        type = struct.type
        count = struct.count
        sort_key = struct.sort_key
        new(type: type, count: count, sort_key: sort_key, additional_properties: struct)
      end

      # Serialize an instance of AutomationAddToBatchRetain to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "type": @type, "count": @count, "sort_key": @sort_key }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.type.is_a?(Automations::AutomationAddToBatchRetainType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.count.is_a?(Integer) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
        obj.sort_key&.is_a?(String) != false || raise("Passed value for field obj.sort_key is not the expected type, validation failed.")
      end
    end
  end
end
