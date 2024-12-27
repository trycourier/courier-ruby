# frozen_string_literal: true

require_relative "brand_snippet"
require "json"

module Courier
  class Brands
    class BrandSnippets
      attr_reader :items, :additional_properties

      # @param items [Array<Brands::BrandSnippet>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Brands::BrandSnippets]
      def initialize(items:, additional_properties: nil)
        # @type [Array<Brands::BrandSnippet>]
        @items = items
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandSnippets
      #
      # @param json_object [JSON]
      # @return [Brands::BrandSnippets]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        items = parsed_json["items"]&.map do |v|
          v = v.to_json
          Brands::BrandSnippet.from_json(json_object: v)
        end
        new(items: items, additional_properties: struct)
      end

      # Serialize an instance of BrandSnippets to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "items": @items }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
      end
    end
  end
end
