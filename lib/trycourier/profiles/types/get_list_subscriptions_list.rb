# frozen_string_literal: true

require_relative "../../commons/types/recipient_preferences"
require "json"

module Courier
  class Profiles
    class GetListSubscriptionsList
      attr_reader :id, :name, :created, :updated, :preferences, :additional_properties

      # @param id [String]
      # @param name [String] List name
      # @param created [String] The date/time of when the list was created. Represented as a string in ISO format.
      # @param updated [String] The date/time of when the list was updated. Represented as a string in ISO format.
      # @param preferences [Commons::RecipientPreferences]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::GetListSubscriptionsList]
      def initialize(id:, name:, created:, updated:, preferences: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] List name
        @name = name
        # @type [String] The date/time of when the list was created. Represented as a string in ISO format.
        @created = created
        # @type [String] The date/time of when the list was updated. Represented as a string in ISO format.
        @updated = updated
        # @type [Commons::RecipientPreferences]
        @preferences = preferences
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of GetListSubscriptionsList
      #
      # @param json_object [JSON]
      # @return [Profiles::GetListSubscriptionsList]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        name = struct.name
        created = struct.created
        updated = struct.updated
        if parsed_json["preferences"].nil?
          preferences = nil
        else
          preferences = parsed_json["preferences"].to_json
          preferences = Commons::RecipientPreferences.from_json(json_object: preferences)
        end
        new(id: id, name: name, created: created, updated: updated, preferences: preferences,
            additional_properties: struct)
      end

      # Serialize an instance of GetListSubscriptionsList to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "id": @id, "name": @name, "created": @created, "updated": @updated, "preferences": @preferences }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.created.is_a?(String) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
        obj.updated.is_a?(String) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
        obj.preferences.nil? || Commons::RecipientPreferences.validate_raw(obj: obj.preferences)
      end
    end
  end
end
