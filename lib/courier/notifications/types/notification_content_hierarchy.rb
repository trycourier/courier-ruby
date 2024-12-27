# frozen_string_literal: true

require "json"

module Courier
  class Notifications
    class NotificationContentHierarchy
      attr_reader :parent, :children, :additional_properties

      # @param parent [String]
      # @param children [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Notifications::NotificationContentHierarchy]
      def initialize(parent: nil, children: nil, additional_properties: nil)
        # @type [String]
        @parent = parent
        # @type [String]
        @children = children
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of NotificationContentHierarchy
      #
      # @param json_object [JSON]
      # @return [Notifications::NotificationContentHierarchy]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        parent = struct.parent
        children = struct.children
        new(parent: parent, children: children, additional_properties: struct)
      end

      # Serialize an instance of NotificationContentHierarchy to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "parent": @parent, "children": @children }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.parent&.is_a?(String) != false || raise("Passed value for field obj.parent is not the expected type, validation failed.")
        obj.children&.is_a?(String) != false || raise("Passed value for field obj.children is not the expected type, validation failed.")
      end
    end
  end
end
