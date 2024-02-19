# frozen_string_literal: true

require_relative "../../commons/types/recipient_preferences"
require "json"

module Courier
  class Profiles
    class SubscribeToListsRequestListObject
      attr_reader :list_id, :preferences, :additional_properties

      # @param list_id [String]
      # @param preferences [Commons::RecipientPreferences]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::SubscribeToListsRequestListObject]
      def initialize(list_id:, preferences: nil, additional_properties: nil)
        # @type [String]
        @list_id = list_id
        # @type [Commons::RecipientPreferences]
        @preferences = preferences
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SubscribeToListsRequestListObject
      #
      # @param json_object [JSON]
      # @return [Profiles::SubscribeToListsRequestListObject]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        list_id = struct.listId
        if parsed_json["preferences"].nil?
          preferences = nil
        else
          preferences = parsed_json["preferences"].to_json
          preferences = Commons::RecipientPreferences.from_json(json_object: preferences)
        end
        new(list_id: list_id, preferences: preferences, additional_properties: struct)
      end

      # Serialize an instance of SubscribeToListsRequestListObject to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "listId": @list_id, "preferences": @preferences }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.list_id.is_a?(String) != false || raise("Passed value for field obj.list_id is not the expected type, validation failed.")
        obj.preferences.nil? || Commons::RecipientPreferences.validate_raw(obj: obj.preferences)
      end
    end
  end
end
