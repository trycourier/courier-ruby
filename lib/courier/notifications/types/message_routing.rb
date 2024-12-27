# frozen_string_literal: true

require_relative "message_routing_method"
require_relative "message_routing_channel"
require "json"

module Courier
  class Notifications
    class MessageRouting
      attr_reader :method, :channels, :additional_properties

      # @param method [Notifications::MessageRoutingMethod]
      # @param channels [Array<Notifications::MessageRoutingChannel>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::MessageRouting]
      def initialize(method:, channels:, additional_properties: nil)
        # @type [Notifications::MessageRoutingMethod]
        @method = method
        # @type [Array<Notifications::MessageRoutingChannel>]
        @channels = channels
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MessageRouting
      #
      # @param json_object [JSON]
      # @return [Notifications::MessageRouting]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        method = struct.method
        channels = parsed_json["channels"]&.map do |v|
          v = v.to_json
          Notifications::MessageRoutingChannel.from_json(json_object: v)
        end
        new(method: method, channels: channels, additional_properties: struct)
      end

      # Serialize an instance of MessageRouting to a JSON object
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
        obj.method.is_a?(Notifications::MessageRoutingMethod) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
        obj.channels.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
      end
    end
  end
end
