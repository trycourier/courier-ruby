# frozen_string_literal: true

require_relative "../../commons/types/preference_status"
require_relative "../../commons/types/rule"
require_relative "../../commons/types/channel_preference"
require_relative "channel_source"
require "json"

module Courier
  class Send
    class Preference
      attr_reader :status, :rules, :channel_preferences, :source, :additional_properties

      # @param status [Commons::PreferenceStatus]
      # @param rules [Array<Commons::Rule>]
      # @param channel_preferences [Array<Commons::ChannelPreference>]
      # @param source [Send::ChannelSource]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Preference]
      def initialize(status:, rules: nil, channel_preferences: nil, source: nil, additional_properties: nil)
        # @type [Commons::PreferenceStatus]
        @status = status
        # @type [Array<Commons::Rule>]
        @rules = rules
        # @type [Array<Commons::ChannelPreference>]
        @channel_preferences = channel_preferences
        # @type [Send::ChannelSource]
        @source = source
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Preference
      #
      # @param json_object [JSON]
      # @return [Send::Preference]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        status = struct.status
        rules = parsed_json["rules"]&.map do |v|
          v = v.to_json
          Commons::Rule.from_json(json_object: v)
        end
        channel_preferences = parsed_json["channel_preferences"]&.map do |v|
          v = v.to_json
          Commons::ChannelPreference.from_json(json_object: v)
        end
        source = struct.source
        new(status: status, rules: rules, channel_preferences: channel_preferences, source: source,
            additional_properties: struct)
      end

      # Serialize an instance of Preference to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "status": @status, "rules": @rules, "channel_preferences": @channel_preferences, "source": @source }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.status.is_a?(Commons::PreferenceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.rules&.is_a?(Array) != false || raise("Passed value for field obj.rules is not the expected type, validation failed.")
        obj.channel_preferences&.is_a?(Array) != false || raise("Passed value for field obj.channel_preferences is not the expected type, validation failed.")
        obj.source&.is_a?(Send::ChannelSource) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
      end
    end
  end
end
