# frozen_string_literal: true

require_relative "metadata"
require "json"

module Courier
  class Send
    class RoutingStrategyProvider
      attr_reader :name, :config, :if_, :metadata, :additional_properties

      # @param name [String]
      # @param config [Hash{String => String}]
      # @param if_ [String]
      # @param metadata [Send::Metadata]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::RoutingStrategyProvider]
      def initialize(name:, metadata:, config: nil, if_: nil, additional_properties: nil)
        # @type [String]
        @name = name
        # @type [Hash{String => String}]
        @config = config
        # @type [String]
        @if_ = if_
        # @type [Send::Metadata]
        @metadata = metadata
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RoutingStrategyProvider
      #
      # @param json_object [JSON]
      # @return [Send::RoutingStrategyProvider]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = struct.name
        config = struct.config
        if_ = struct.if
        if parsed_json["metadata"].nil?
          metadata = nil
        else
          metadata = parsed_json["metadata"].to_json
          metadata = Send::Metadata.from_json(json_object: metadata)
        end
        new(name: name, config: config, if_: if_, metadata: metadata, additional_properties: struct)
      end

      # Serialize an instance of RoutingStrategyProvider to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "name": @name, "config": @config, "if": @if_, "metadata": @metadata }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.config&.is_a?(Hash) != false || raise("Passed value for field obj.config is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        Send::Metadata.validate_raw(obj: obj.metadata)
      end
    end
  end
end
