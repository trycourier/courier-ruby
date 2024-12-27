# frozen_string_literal: true

require_relative "message_routing"
require_relative "notification_tag"
require "json"

module Courier
  class Notifications
    class Notification
      attr_reader :created_at, :updated_at, :id, :routing, :tags, :title, :topic_id, :note, :additional_properties

      # @param created_at [Long]
      # @param updated_at [Long]
      # @param id [String]
      # @param routing [Notifications::MessageRouting]
      # @param tags [Notifications::NotificationTag]
      # @param title [String]
      # @param topic_id [String]
      # @param note [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::Notification]
      def initialize(created_at:, updated_at:, id:, routing:, topic_id:, note:, tags: nil, title: nil,
                     additional_properties: nil)
        # @type [Long]
        @created_at = created_at
        # @type [Long]
        @updated_at = updated_at
        # @type [String]
        @id = id
        # @type [Notifications::MessageRouting]
        @routing = routing
        # @type [Notifications::NotificationTag]
        @tags = tags
        # @type [String]
        @title = title
        # @type [String]
        @topic_id = topic_id
        # @type [String]
        @note = note
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Notification
      #
      # @param json_object [JSON]
      # @return [Notifications::Notification]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created_at = struct.created_at
        updated_at = struct.updated_at
        id = struct.id
        if parsed_json["routing"].nil?
          routing = nil
        else
          routing = parsed_json["routing"].to_json
          routing = Notifications::MessageRouting.from_json(json_object: routing)
        end
        if parsed_json["tags"].nil?
          tags = nil
        else
          tags = parsed_json["tags"].to_json
          tags = Notifications::NotificationTag.from_json(json_object: tags)
        end
        title = struct.title
        topic_id = struct.topic_id
        note = struct.note
        new(created_at: created_at, updated_at: updated_at, id: id, routing: routing, tags: tags, title: title,
            topic_id: topic_id, note: note, additional_properties: struct)
      end

      # Serialize an instance of Notification to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "created_at": @created_at,
          "updated_at": @updated_at,
          "id": @id,
          "routing": @routing,
          "tags": @tags,
          "title": @title,
          "topic_id": @topic_id,
          "note": @note
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.created_at.is_a?(Long) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.updated_at.is_a?(Long) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        Notifications::MessageRouting.validate_raw(obj: obj.routing)
        obj.tags.nil? || Notifications::NotificationTag.validate_raw(obj: obj.tags)
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.topic_id.is_a?(String) != false || raise("Passed value for field obj.topic_id is not the expected type, validation failed.")
        obj.note.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
      end
    end
  end
end
