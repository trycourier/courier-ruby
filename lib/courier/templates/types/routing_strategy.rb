# frozen_string_literal: true

require_relative "routing_strategy_method"
require_relative "channel_identifier"
require "json"

module Courier
  class Templates
    class RoutingStrategy
      attr_reader :method, :channels, :additional_properties

      # @param method [Templates::RoutingStrategyMethod] The method for selecting channels to send the message with. Value can be either 'single' or 'all'. If not provided will default to 'single'
      # @param channels [Array<Templates::CHANNEL_IDENTIFIER>] An array of valid channel identifiers (like email, push, sms, etc.) and additional routing nodes.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Templates::RoutingStrategy]
      def initialize(method:, channels:, additional_properties: nil)
        # @type [Templates::RoutingStrategyMethod] The method for selecting channels to send the message with. Value can be either 'single' or 'all'. If not provided will default to 'single'
        @method = method
        # @type [Array<Templates::CHANNEL_IDENTIFIER>] An array of valid channel identifiers (like email, push, sms, etc.) and additional routing nodes.
        @channels = channels
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RoutingStrategy
      #
      # @param json_object [JSON]
      # @return [Templates::RoutingStrategy]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        method = struct.method
        channels = struct.channels
        new(method: method, channels: channels, additional_properties: struct)
      end

      # Serialize an instance of RoutingStrategy to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "method": @method, "channels": @channels }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.method.is_a?(Templates::RoutingStrategyMethod) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.channels.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
      end
    end
  end
end
