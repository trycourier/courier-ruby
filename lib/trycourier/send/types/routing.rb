# frozen_string_literal: true

require_relative "routing_method"
require_relative "routing_channel"
require "json"

module Courier
  class Send
    # Allows you to customize which channel(s) Courier will potentially deliver the message.
    # If no routing key is specified, Courier will use the default routing configuration or
    # routing defined by the template.
    class Routing
      attr_reader :method, :channels, :additional_properties

      # @param method [Send::RoutingMethod]
      # @param channels [Array<Send::RoutingChannel>] A list of channels or providers to send the message through. Can also recursively define
      #   sub-routing methods, which can be useful for defining advanced push notification
      #   delivery strategies.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Routing]
      def initialize(method:, channels:, additional_properties: nil)
        # @type [Send::RoutingMethod]
        @method = method
        # @type [Array<Send::RoutingChannel>] A list of channels or providers to send the message through. Can also recursively define
        #   sub-routing methods, which can be useful for defining advanced push notification
        #   delivery strategies.
        @channels = channels
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Routing
      #
      # @param json_object [JSON]
      # @return [Send::Routing]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        method = struct.method
        channels = parsed_json["channels"]&.map do |v|
          v = v.to_json
          Send::RoutingChannel.from_json(json_object: v)
        end
        new(method: method, channels: channels, additional_properties: struct)
      end

      # Serialize an instance of Routing to a JSON object
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
        obj.method.is_a?(Send::RoutingMethod) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.channels.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
      end
    end
  end
end
