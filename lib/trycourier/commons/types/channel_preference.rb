# frozen_string_literal: true

require_relative "channel_classification"
require "json"

module Courier
  class Commons
    class ChannelPreference
      attr_reader :channel, :additional_properties

      # @param channel [CHANNEL_CLASSIFICATION]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::ChannelPreference]
      def initialize(channel:, additional_properties: nil)
        # @type [CHANNEL_CLASSIFICATION]
        @channel = channel
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ChannelPreference
      #
      # @param json_object [JSON]
      # @return [Commons::ChannelPreference]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        channel = Commons::CHANNEL_CLASSIFICATION.key(parsed_json["channel"]) || parsed_json["channel"]
        new(channel: channel, additional_properties: struct)
      end

      # Serialize an instance of ChannelPreference to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "channel": Commons::CHANNEL_CLASSIFICATION[@channel] || @channel }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.channel.is_a?(Commons::CHANNEL_CLASSIFICATION) != false || raise("Passed value for field obj.channel is not the expected type, validation failed.")
      end
    end
  end
end
