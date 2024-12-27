# frozen_string_literal: true

require_relative "tag_data"
require "json"

module Courier
  class Templates
    class Tag
      attr_reader :data, :additional_properties

      # @param data [Array<Templates::TagData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Templates::Tag]
      def initialize(data:, additional_properties: nil)
        # @type [Array<Templates::TagData>]
        @data = data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Tag
      #
      # @param json_object [JSON]
      # @return [Templates::Tag]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        data = parsed_json["data"]&.map do |v|
          v = v.to_json
          Templates::TagData.from_json(json_object: v)
        end
        new(data: data, additional_properties: struct)
      end

      # Serialize an instance of Tag to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "data": @data }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.data.is_a?(Array) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
      end
    end
  end
end
