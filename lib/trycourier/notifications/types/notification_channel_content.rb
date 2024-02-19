# frozen_string_literal: true

require "json"

module Courier
  class Notifications
    class NotificationChannelContent
      attr_reader :subject, :title, :additional_properties

      # @param subject [String]
      # @param title [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::NotificationChannelContent]
      def initialize(subject: nil, title: nil, additional_properties: nil)
        # @type [String]
        @subject = subject
        # @type [String]
        @title = title
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of NotificationChannelContent
      #
      # @param json_object [JSON]
      # @return [Notifications::NotificationChannelContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        subject = struct.subject
        title = struct.title
        new(subject: subject, title: title, additional_properties: struct)
      end

      # Serialize an instance of NotificationChannelContent to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "subject": @subject, "title": @title }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.subject&.is_a?(String) != false || raise("Passed value for field obj.subject is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      end
    end
  end
end
