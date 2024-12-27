# frozen_string_literal: true

require_relative "criteria"
require "json"

module Courier
  class Send
    class Timeout
      attr_reader :provider, :channel, :message, :escalation, :criteria, :additional_properties

      # @param provider [Hash{String => String}]
      # @param channel [Hash{String => String}]
      # @param message [Integer]
      # @param escalation [Integer]
      # @param criteria [Send::Criteria]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Timeout]
      def initialize(provider: nil, channel: nil, message: nil, escalation: nil, criteria: nil,
                     additional_properties: nil)
        # @type [Hash{String => String}]
        @provider = provider
        # @type [Hash{String => String}]
        @channel = channel
        # @type [Integer]
        @message = message
        # @type [Integer]
        @escalation = escalation
        # @type [Send::Criteria]
        @criteria = criteria
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Timeout
      #
      # @param json_object [JSON]
      # @return [Send::Timeout]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        provider = struct.provider
        channel = struct.channel
        message = struct.message
        escalation = struct.escalation
        criteria = struct.criteria
        new(provider: provider, channel: channel, message: message, escalation: escalation, criteria: criteria,
            additional_properties: struct)
      end

      # Serialize an instance of Timeout to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "provider": @provider,
          "channel": @channel,
          "message": @message,
          "escalation": @escalation,
          "criteria": @criteria
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.provider&.is_a?(Hash) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
        obj.channel&.is_a?(Hash) != false || raise("Passed value for field obj.channel is not the expected type, validation failed.")
        obj.message&.is_a?(Integer) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
        obj.escalation&.is_a?(Integer) != false || raise("Passed value for field obj.escalation is not the expected type, validation failed.")
        obj.criteria&.is_a?(Send::Criteria) != false || raise("Passed value for field obj.criteria is not the expected type, validation failed.")
      end
    end
  end
end
