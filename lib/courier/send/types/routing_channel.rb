# frozen_string_literal: true

require "json"
require_relative "routing_strategy_channel"
require_relative "routing_strategy_provider"

module Courier
  class Send
    class RoutingChannel
      # Deserialize a JSON object to an instance of RoutingChannel
      #
      # @param json_object [JSON]
      # @return [Send::RoutingChannel]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Send::RoutingStrategyChannel.validate_raw(obj: struct)
          return Send::RoutingStrategyChannel.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Send::RoutingStrategyProvider.validate_raw(obj: struct)
          return Send::RoutingStrategyProvider.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          return json_object
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Send::RoutingStrategyChannel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Send::RoutingStrategyProvider.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
