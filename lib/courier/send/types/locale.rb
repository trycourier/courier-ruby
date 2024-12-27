# frozen_string_literal: true

require "json"

module Courier
  class Send
    class Locale
      attr_reader :content, :additional_properties

      # @param content [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Locale]
      def initialize(content:, additional_properties: nil)
        # @type [String]
        @content = content
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Locale
      #
      # @param json_object [JSON]
      # @return [Send::Locale]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        content = struct.content
        new(content: content, additional_properties: struct)
      end

      # Serialize an instance of Locale to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "content": @content }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      end
    end
  end
end
