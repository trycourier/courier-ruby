# frozen_string_literal: true

require_relative "routing_method"
require_relative "timeouts"
require_relative "override"
require_relative "channel_metadata"
require "json"

module Courier
  class Send
    class Channel
      attr_reader :brand_id, :providers, :routing_method, :if_, :timeouts, :override, :metadata, :additional_properties

      # @param brand_id [String] Id of the brand that should be used for rendering the message.
      #   If not specified, the brand configured as default brand will be used.
      # @param providers [Array<String>] A list of providers enabled for this channel. Courier will select
      #   one provider to send through unless routing_method is set to all.
      # @param routing_method [Send::RoutingMethod] The method for selecting the providers to send the message with.
      #   Single will send to one of the available providers for this channel,
      #   all will send the message through all channels. Defaults to `single`.
      # @param if_ [String] A JavaScript conditional expression to determine if the message should
      #   be sent through the channel. Has access to the data and profile object.
      #   For example, `data.name === profile.name`
      # @param timeouts [Send::Timeouts]
      # @param override [Send::Override] Channel specific overrides.
      # @param metadata [Send::ChannelMetadata]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Channel]
      def initialize(brand_id: nil, providers: nil, routing_method: nil, if_: nil, timeouts: nil, override: nil,
                     metadata: nil, additional_properties: nil)
        # @type [String] Id of the brand that should be used for rendering the message.
        #   If not specified, the brand configured as default brand will be used.
        @brand_id = brand_id
        # @type [Array<String>] A list of providers enabled for this channel. Courier will select
        #   one provider to send through unless routing_method is set to all.
        @providers = providers
        # @type [Send::RoutingMethod] The method for selecting the providers to send the message with.
        #   Single will send to one of the available providers for this channel,
        #   all will send the message through all channels. Defaults to `single`.
        @routing_method = routing_method
        # @type [String] A JavaScript conditional expression to determine if the message should
        #   be sent through the channel. Has access to the data and profile object.
        #   For example, `data.name === profile.name`
        @if_ = if_
        # @type [Send::Timeouts]
        @timeouts = timeouts
        # @type [Send::Override] Channel specific overrides.
        @override = override
        # @type [Send::ChannelMetadata]
        @metadata = metadata
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Channel
      #
      # @param json_object [JSON]
      # @return [Send::Channel]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        brand_id = struct.brand_id
        providers = struct.providers
        routing_method = struct.routing_method
        if_ = struct.if
        if parsed_json["timeouts"].nil?
          timeouts = nil
        else
          timeouts = parsed_json["timeouts"].to_json
          timeouts = Send::Timeouts.from_json(json_object: timeouts)
        end
        override = struct.override
        if parsed_json["metadata"].nil?
          metadata = nil
        else
          metadata = parsed_json["metadata"].to_json
          metadata = Send::ChannelMetadata.from_json(json_object: metadata)
        end
        new(brand_id: brand_id, providers: providers, routing_method: routing_method, if_: if_, timeouts: timeouts,
            override: override, metadata: metadata, additional_properties: struct)
      end

      # Serialize an instance of Channel to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "brand_id": @brand_id,
          "providers": @providers,
          "routing_method": @routing_method,
          "if": @if_,
          "timeouts": @timeouts,
          "override": @override,
          "metadata": @metadata
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.brand_id&.is_a?(String) != false || raise("Passed value for field obj.brand_id is not the expected type, validation failed.")
        obj.providers&.is_a?(Array) != false || raise("Passed value for field obj.providers is not the expected type, validation failed.")
        obj.routing_method&.is_a?(Send::RoutingMethod) != false || raise("Passed value for field obj.routing_method is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.timeouts.nil? || Send::Timeouts.validate_raw(obj: obj.timeouts)
        obj.override&.is_a?(Send::Override) != false || raise("Passed value for field obj.override is not the expected type, validation failed.")
        obj.metadata.nil? || Send::ChannelMetadata.validate_raw(obj: obj.metadata)
      end
    end
  end
end
