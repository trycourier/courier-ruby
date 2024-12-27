# frozen_string_literal: true

require_relative "routing_method"
require_relative "message_providers"
require "json"

module Courier
  class Send
    class RoutingStrategyChannel
      attr_reader :channel, :config, :method, :providers, :if_, :additional_properties

      # @param channel [String]
      # @param config [Hash{String => String}]
      # @param method [Send::RoutingMethod]
      # @param providers [Send::MESSAGE_PROVIDERS]
      # @param if_ [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::RoutingStrategyChannel]
      def initialize(channel:, config: nil, method: nil, providers: nil, if_: nil, additional_properties: nil)
        # @type [String]
        @channel = channel
        # @type [Hash{String => String}]
        @config = config
        # @type [Send::RoutingMethod]
        @method = method
        # @type [Send::MESSAGE_PROVIDERS]
        @providers = providers
        # @type [String]
        @if_ = if_
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RoutingStrategyChannel
      #
      # @param json_object [JSON]
      # @return [Send::RoutingStrategyChannel]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        channel = struct.channel
        config = struct.config
        method = struct.method
        providers = struct.providers
        if_ = struct.if
        new(channel: channel, config: config, method: method, providers: providers, if_: if_,
            additional_properties: struct)
      end

      # Serialize an instance of RoutingStrategyChannel to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "channel": @channel, "config": @config, "method": @method, "providers": @providers, "if": @if_ }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.channel.is_a?(String) != false || raise("Passed value for field obj.channel is not the expected type, validation failed.")
        obj.config&.is_a?(Hash) != false || raise("Passed value for field obj.config is not the expected type, validation failed.")
        obj.method&.is_a?(Send::RoutingMethod) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.providers&.is_a?(Hash) != false || raise("Passed value for field obj.providers is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
      end
    end
  end
end
