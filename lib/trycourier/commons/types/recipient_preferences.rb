# frozen_string_literal: true

require_relative "notification_preferences"
require "json"

module Courier
  class Commons
    class RecipientPreferences
      attr_reader :categories, :notifications, :additional_properties

      # @param categories [Commons::NOTIFICATION_PREFERENCES]
      # @param notifications [Commons::NOTIFICATION_PREFERENCES]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::RecipientPreferences]
      def initialize(categories: nil, notifications: nil, additional_properties: nil)
        # @type [Commons::NOTIFICATION_PREFERENCES]
        @categories = categories
        # @type [Commons::NOTIFICATION_PREFERENCES]
        @notifications = notifications
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RecipientPreferences
      #
      # @param json_object [JSON]
      # @return [Commons::RecipientPreferences]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        categories = struct.categories
        notifications = struct.notifications
        new(categories: categories, notifications: notifications, additional_properties: struct)
      end

      # Serialize an instance of RecipientPreferences to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "categories": @categories, "notifications": @notifications }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.categories&.is_a?(Hash) != false || raise("Passed value for field obj.categories is not the expected type, validation failed.")
        obj.notifications&.is_a?(Hash) != false || raise("Passed value for field obj.notifications is not the expected type, validation failed.")
      end
    end
  end
end
