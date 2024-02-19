# frozen_string_literal: true

require "json"

module Courier
  class Send
    # Syntatic Sugar to provide a fast shorthand for Courier Elemental Blocks.
    class ElementalContentSugar
      attr_reader :title, :body, :additional_properties

      # @param title [String] The title to be displayed by supported channels i.e. push, email (as subject)
      # @param body [String] The text content displayed in the notification.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ElementalContentSugar]
      def initialize(title:, body:, additional_properties: nil)
        # @type [String] The title to be displayed by supported channels i.e. push, email (as subject)
        @title = title
        # @type [String] The text content displayed in the notification.
        @body = body
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ElementalContentSugar
      #
      # @param json_object [JSON]
      # @return [Send::ElementalContentSugar]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        title = struct.title
        body = struct.body
        new(title: title, body: body, additional_properties: struct)
      end

      # Serialize an instance of ElementalContentSugar to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "title": @title, "body": @body }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.body.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
      end
    end
  end
end
