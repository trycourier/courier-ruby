# frozen_string_literal: true

require_relative "preference_status"
require_relative "rule"
require_relative "channel_preference"
require "json"

module Courier
  class Commons
    class NotificationPreferenceDetails
      attr_reader :status, :rules, :channel_preferences, :additional_properties

      # @param status [PREFERENCE_STATUS]
      # @param rules [Array<Commons::Rule>]
      # @param channel_preferences [Array<Commons::ChannelPreference>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::NotificationPreferenceDetails]
      def initialize(status:, rules: nil, channel_preferences: nil, additional_properties: nil)
        # @type [PREFERENCE_STATUS]
        @status = status
        # @type [Array<Commons::Rule>]
        @rules = rules
        # @type [Array<Commons::ChannelPreference>]
        @channel_preferences = channel_preferences
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of NotificationPreferenceDetails
      #
      # @param json_object [JSON]
      # @return [Commons::NotificationPreferenceDetails]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        status = Commons::PREFERENCE_STATUS.key(parsed_json["status"]) || parsed_json["status"]
        rules = parsed_json["rules"]&.map do |v|
          v = v.to_json
          Commons::Rule.from_json(json_object: v)
        end
        channel_preferences = parsed_json["channel_preferences"]&.map do |v|
          v = v.to_json
          Commons::ChannelPreference.from_json(json_object: v)
        end
        new(status: status, rules: rules, channel_preferences: channel_preferences, additional_properties: struct)
      end

      # Serialize an instance of NotificationPreferenceDetails to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "status": Commons::PREFERENCE_STATUS[@status] || @status,
          "rules": @rules,
          "channel_preferences": @channel_preferences
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.status.is_a?(Commons::PREFERENCE_STATUS) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.rules&.is_a?(Array) != false || raise("Passed value for field obj.rules is not the expected type, validation failed.")
        obj.channel_preferences&.is_a?(Array) != false || raise("Passed value for field obj.channel_preferences is not the expected type, validation failed.")
      end
    end
  end
end
