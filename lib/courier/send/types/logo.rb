# frozen_string_literal: true

require "json"

module Courier
  class Send
    class Logo
      attr_reader :href, :image, :additional_properties

      # @param href [String]
      # @param image [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Logo]
      def initialize(href: nil, image: nil, additional_properties: nil)
        # @type [String]
        @href = href
        # @type [String]
        @image = image
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Logo
      #
      # @param json_object [JSON]
      # @return [Send::Logo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        href = struct.href
        image = struct.image
        new(href: href, image: image, additional_properties: struct)
      end

      # Serialize an instance of Logo to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "href": @href, "image": @image }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.href&.is_a?(String) != false || raise("Passed value for field obj.href is not the expected type, validation failed.")
        obj.image&.is_a?(String) != false || raise("Passed value for field obj.image is not the expected type, validation failed.")
      end
    end
  end
end
