# frozen_string_literal: true

require "json"

module Courier
  class Messages
    class RenderedMessageBlock
      attr_reader :type, :text, :additional_properties

      # @param type [String] The block type of the rendered message block.
      # @param text [String] The block text of the rendered message block.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Messages::RenderedMessageBlock]
      def initialize(type:, text:, additional_properties: nil)
        # @type [String] The block type of the rendered message block.
        @type = type
        # @type [String] The block text of the rendered message block.
        @text = text
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RenderedMessageBlock
      #
      # @param json_object [JSON]
      # @return [Messages::RenderedMessageBlock]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        type = struct.type
        text = struct.text
        new(type: type, text: text, additional_properties: struct)
      end

      # Serialize an instance of RenderedMessageBlock to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "type": @type, "text": @text }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      end
    end
  end
end
