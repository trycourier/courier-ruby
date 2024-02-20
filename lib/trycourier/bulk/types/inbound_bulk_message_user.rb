# frozen_string_literal: true

require_relative "../../commons/types/recipient_preferences"
require_relative "../../send/types/user_recipient"
require "json"

module Courier
  class Bulk
    class InboundBulkMessageUser
      attr_reader :preferences, :profile, :recipient, :data, :to, :additional_properties

      # @param preferences [Commons::RecipientPreferences]
      # @param profile [Object]
      # @param recipient [String]
      # @param data [Object]
      # @param to [Send::UserRecipient]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Bulk::InboundBulkMessageUser]
      def initialize(preferences: nil, profile: nil, recipient: nil, data: nil, to: nil, additional_properties: nil)
        # @type [Commons::RecipientPreferences]
        @preferences = preferences
        # @type [Object]
        @profile = profile
        # @type [String]
        @recipient = recipient
        # @type [Object]
        @data = data
        # @type [Send::UserRecipient]
        @to = to
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of InboundBulkMessageUser
      #
      # @param json_object [JSON]
      # @return [Bulk::InboundBulkMessageUser]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["preferences"].nil?
          preferences = nil
        else
          preferences = parsed_json["preferences"].to_json
          preferences = Commons::RecipientPreferences.from_json(json_object: preferences)
        end
        profile = struct.profile
        recipient = struct.recipient
        data = struct.data
        if parsed_json["to"].nil?
          to = nil
        else
          to = parsed_json["to"].to_json
          to = Send::UserRecipient.from_json(json_object: to)
        end
        new(preferences: preferences, profile: profile, recipient: recipient, data: data, to: to,
            additional_properties: struct)
      end

      # Serialize an instance of InboundBulkMessageUser to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "preferences": @preferences, "profile": @profile, "recipient": @recipient, "data": @data, "to": @to }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.preferences.nil? || Commons::RecipientPreferences.validate_raw(obj: obj.preferences)
        obj.profile&.is_a?(Object) != false || raise("Passed value for field obj.profile is not the expected type, validation failed.")
        obj.recipient&.is_a?(String) != false || raise("Passed value for field obj.recipient is not the expected type, validation failed.")
        obj.data&.is_a?(Object) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.to.nil? || Send::UserRecipient.validate_raw(obj: obj.to)
      end
    end
  end
end
