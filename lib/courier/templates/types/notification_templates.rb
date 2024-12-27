# frozen_string_literal: true

require_relative "routing_strategy"
require_relative "tag"
require "json"

module Courier
  class Templates
    class NotificationTemplates
      attr_reader :created_at, :id, :routing, :tags, :title, :updated_at, :additional_properties

      # @param created_at [Long] A UTC timestamp at which notification was created. This is stored as a millisecond representation of the Unix epoch (the time passed since January 1, 1970).
      # @param id [String] A unique identifier associated with the notification.
      # @param routing [Templates::RoutingStrategy] Routing strategy used by this notification.
      # @param tags [Array<Templates::Tag>] A list of tags attached to the notification.
      # @param title [String] The title of the notification.
      # @param updated_at [Long] A UTC timestamp at which notification was updated. This is stored as a millisecond representation of the Unix epoch (the time passed since January 1, 1970).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Templates::NotificationTemplates]
      def initialize(created_at:, id:, routing:, tags:, title:, updated_at:, additional_properties: nil)
        # @type [Long] A UTC timestamp at which notification was created. This is stored as a millisecond representation of the Unix epoch (the time passed since January 1, 1970).
        @created_at = created_at
        # @type [String] A unique identifier associated with the notification.
        @id = id
        # @type [Templates::RoutingStrategy] Routing strategy used by this notification.
        @routing = routing
        # @type [Array<Templates::Tag>] A list of tags attached to the notification.
        @tags = tags
        # @type [String] The title of the notification.
        @title = title
        # @type [Long] A UTC timestamp at which notification was updated. This is stored as a millisecond representation of the Unix epoch (the time passed since January 1, 1970).
        @updated_at = updated_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of NotificationTemplates
      #
      # @param json_object [JSON]
      # @return [Templates::NotificationTemplates]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created_at = struct.created_at
        id = struct.id
        if parsed_json["routing"].nil?
          routing = nil
        else
          routing = parsed_json["routing"].to_json
          routing = Templates::RoutingStrategy.from_json(json_object: routing)
        end
        tags = parsed_json["tags"]&.map do |v|
          v = v.to_json
          Templates::Tag.from_json(json_object: v)
        end
        title = struct.title
        updated_at = struct.updated_at
        new(created_at: created_at, id: id, routing: routing, tags: tags, title: title, updated_at: updated_at,
            additional_properties: struct)
      end

      # Serialize an instance of NotificationTemplates to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "created_at": @created_at,
          "id": @id,
          "routing": @routing,
          "tags": @tags,
          "title": @title,
          "updated_at": @updated_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.created_at.is_a?(Long) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        Templates::RoutingStrategy.validate_raw(obj: obj.routing)
        obj.tags.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.updated_at.is_a?(Long) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      end
    end
  end
end
