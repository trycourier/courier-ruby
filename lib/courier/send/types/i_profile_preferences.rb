# frozen_string_literal: true

require_relative "i_preferences"
require "json"

module Courier
  class Send
    class IProfilePreferences
      attr_reader :categories, :notifications, :template_id, :additional_properties

      # @param categories [Send::I_PREFERENCES]
      # @param notifications [Send::I_PREFERENCES]
      # @param template_id [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::IProfilePreferences]
      def initialize(notifications:, categories: nil, template_id: nil, additional_properties: nil)
        # @type [Send::I_PREFERENCES]
        @categories = categories
        # @type [Send::I_PREFERENCES]
        @notifications = notifications
        # @type [String]
        @template_id = template_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of IProfilePreferences
      #
      # @param json_object [JSON]
      # @return [Send::IProfilePreferences]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        categories = struct.categories
        notifications = struct.notifications
        template_id = struct.templateId
        new(categories: categories, notifications: notifications, template_id: template_id,
            additional_properties: struct)
      end

      # Serialize an instance of IProfilePreferences to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "categories": @categories, "notifications": @notifications, "templateId": @template_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.categories&.is_a?(Hash) != false || raise("Passed value for field obj.categories is not the expected type, validation failed.")
        obj.notifications.is_a?(Hash) != false || raise("Passed value for field obj.notifications is not the expected type, validation failed.")
        obj.template_id&.is_a?(String) != false || raise("Passed value for field obj.template_id is not the expected type, validation failed.")
      end
    end
  end
end
