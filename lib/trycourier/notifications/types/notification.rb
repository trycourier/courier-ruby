# frozen_string_literal: true

require_relative "message_routing"
require "json"

module Courier
  class Notifications
    class Notification
      attr_reader :created_at, :id, :routing, :additional_properties

      # @param created_at [Long]
      # @param id [String]
      # @param routing [Notifications::MessageRouting]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::Notification]
      def initialize(created_at:, id:, routing:, additional_properties: nil)
        # @type [Long]
        @created_at = created_at
        # @type [String]
        @id = id
        # @type [Notifications::MessageRouting]
        @routing = routing
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
        id = struct.id
        if parsed_json["routing"].nil?
          routing = nil
        else
          routing = parsed_json["routing"].to_json
          routing = Notifications::MessageRouting.from_json(json_object: routing)
        end
        new(created_at: created_at, id: id, routing: routing, additional_properties: struct)
      end

      # Serialize an instance of Notification to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "created_at": @created_at, "id": @id, "routing": @routing }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.created_at.is_a?(Long) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        Notifications::MessageRouting.validate_raw(obj: obj.routing)
      end
    end
  end
end
