# frozen_string_literal: true

require_relative "metadata"
require "json"

module Courier
  class Send
    class MessageProvidersType
      attr_reader :override, :if_, :timeouts, :metadata, :additional_properties

      # @param override [Hash{String => String}] Provider specific overrides.
      # @param if_ [String] A JavaScript conditional expression to determine if the message should be sent
      #   through the channel. Has access to the data and profile object. For example,
      #   `data.name === profile.name`
      # @param timeouts [Integer]
      # @param metadata [Send::Metadata]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::MessageProvidersType]
      def initialize(override: nil, if_: nil, timeouts: nil, metadata: nil, additional_properties: nil)
        # @type [Hash{String => String}] Provider specific overrides.
        @override = override
        # @type [String] A JavaScript conditional expression to determine if the message should be sent
        #   through the channel. Has access to the data and profile object. For example,
        #   `data.name === profile.name`
        @if_ = if_
        # @type [Integer]
        @timeouts = timeouts
        # @type [Send::Metadata]
        @metadata = metadata
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MessageProvidersType
      #
      # @param json_object [JSON]
      # @return [Send::MessageProvidersType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        override = struct.override
        if_ = struct.if
        timeouts = struct.timeouts
        if parsed_json["metadata"].nil?
          metadata = nil
        else
          metadata = parsed_json["metadata"].to_json
          metadata = Send::Metadata.from_json(json_object: metadata)
        end
        new(override: override, if_: if_, timeouts: timeouts, metadata: metadata, additional_properties: struct)
      end

      # Serialize an instance of MessageProvidersType to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "override": @override, "if": @if_, "timeouts": @timeouts, "metadata": @metadata }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.override&.is_a?(Hash) != false || raise("Passed value for field obj.override is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.timeouts&.is_a?(Integer) != false || raise("Passed value for field obj.timeouts is not the expected type, validation failed.")
        obj.metadata.nil? || Send::Metadata.validate_raw(obj: obj.metadata)
      end
    end
  end
end
