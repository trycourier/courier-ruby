# frozen_string_literal: true

require "json"

module Courier
  class Send
    class EmailHead
      attr_reader :inherit_default, :content, :additional_properties

      # @param inherit_default [Boolean]
      # @param content [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::EmailHead]
      def initialize(inherit_default:, content: nil, additional_properties: nil)
        # @type [Boolean]
        @inherit_default = inherit_default
        # @type [String]
        @content = content
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EmailHead
      #
      # @param json_object [JSON]
      # @return [Send::EmailHead]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        inherit_default = struct.inheritDefault
        content = struct.content
        new(inherit_default: inherit_default, content: content, additional_properties: struct)
      end

      # Serialize an instance of EmailHead to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "inheritDefault": @inherit_default, "content": @content }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.inherit_default.is_a?(Boolean) != false || raise("Passed value for field obj.inherit_default is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      end
    end
  end
end
