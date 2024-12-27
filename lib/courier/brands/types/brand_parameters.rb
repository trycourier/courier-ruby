# frozen_string_literal: true

require_relative "brand_settings"
require_relative "brand_snippets"
require "json"

module Courier
  class Brands
    class BrandParameters
      attr_reader :id, :name, :settings, :snippets, :additional_properties

      # @param id [String]
      # @param name [String] The name of the brand.
      # @param settings [Brands::BrandSettings]
      # @param snippets [Brands::BrandSnippets]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Brands::BrandParameters]
      def initialize(name:, settings:, id: nil, snippets: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The name of the brand.
        @name = name
        # @type [Brands::BrandSettings]
        @settings = settings
        # @type [Brands::BrandSnippets]
        @snippets = snippets
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandParameters
      #
      # @param json_object [JSON]
      # @return [Brands::BrandParameters]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        name = struct.name
        if parsed_json["settings"].nil?
          settings = nil
        else
          settings = parsed_json["settings"].to_json
          settings = Brands::BrandSettings.from_json(json_object: settings)
        end
        if parsed_json["snippets"].nil?
          snippets = nil
        else
          snippets = parsed_json["snippets"].to_json
          snippets = Brands::BrandSnippets.from_json(json_object: snippets)
        end
        new(id: id, name: name, settings: settings, snippets: snippets, additional_properties: struct)
      end

      # Serialize an instance of BrandParameters to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "id": @id, "name": @name, "settings": @settings, "snippets": @snippets }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        Brands::BrandSettings.validate_raw(obj: obj.settings)
        obj.snippets.nil? || Brands::BrandSnippets.validate_raw(obj: obj.snippets)
      end
    end
  end
end
