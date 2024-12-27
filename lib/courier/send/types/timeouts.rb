# frozen_string_literal: true

require "json"

module Courier
  class Send
    class Timeouts
      attr_reader :provider, :channel, :additional_properties

      # @param provider [Integer]
      # @param channel [Integer]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Timeouts]
      def initialize(provider: nil, channel: nil, additional_properties: nil)
        # @type [Integer]
        @provider = provider
        # @type [Integer]
        @channel = channel
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Timeouts
      #
      # @param json_object [JSON]
      # @return [Send::Timeouts]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        provider = struct.provider
        channel = struct.channel
        new(provider: provider, channel: channel, additional_properties: struct)
      end

      # Serialize an instance of Timeouts to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "provider": @provider, "channel": @channel }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.provider&.is_a?(Integer) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
        obj.channel&.is_a?(Integer) != false || raise("Passed value for field obj.channel is not the expected type, validation failed.")
      end
    end
  end
end
