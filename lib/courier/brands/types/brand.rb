# frozen_string_literal: true

require_relative "brand_settings"
require_relative "brand_snippets"
require "json"

module Courier
  class Brands
    class Brand
      attr_reader :created, :id, :name, :published, :settings, :updated, :snippets, :version, :additional_properties

      # @param created [Integer] The date/time of when the brand was created. Represented in milliseconds since Unix epoch.
      # @param id [String] Brand Identifier
      # @param name [String] Brand name
      # @param published [Integer] The date/time of when the brand was published. Represented in milliseconds since Unix epoch.
      # @param settings [Brands::BrandSettings]
      # @param updated [Integer] The date/time of when the brand was updated. Represented in milliseconds since Unix epoch.
      # @param snippets [Brands::BrandSnippets]
      # @param version [String] The version identifier for the brand
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Brands::Brand]
      def initialize(created:, name:, published:, settings:, updated:, version:, id: nil, snippets: nil,
                     additional_properties: nil)
        # @type [Integer] The date/time of when the brand was created. Represented in milliseconds since Unix epoch.
        @created = created
        # @type [String] Brand Identifier
        @id = id
        # @type [String] Brand name
        @name = name
        # @type [Integer] The date/time of when the brand was published. Represented in milliseconds since Unix epoch.
        @published = published
        # @type [Brands::BrandSettings]
        @settings = settings
        # @type [Integer] The date/time of when the brand was updated. Represented in milliseconds since Unix epoch.
        @updated = updated
        # @type [Brands::BrandSnippets]
        @snippets = snippets
        # @type [String] The version identifier for the brand
        @version = version
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Brand
      #
      # @param json_object [JSON]
      # @return [Brands::Brand]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created = struct.created
        id = struct.id
        name = struct.name
        published = struct.published
        if parsed_json["settings"].nil?
          settings = nil
        else
          settings = parsed_json["settings"].to_json
          settings = Brands::BrandSettings.from_json(json_object: settings)
        end
        updated = struct.updated
        if parsed_json["snippets"].nil?
          snippets = nil
        else
          snippets = parsed_json["snippets"].to_json
          snippets = Brands::BrandSnippets.from_json(json_object: snippets)
        end
        version = struct.version
        new(created: created, id: id, name: name, published: published, settings: settings, updated: updated,
            snippets: snippets, version: version, additional_properties: struct)
      end

      # Serialize an instance of Brand to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "created": @created,
          "id": @id,
          "name": @name,
          "published": @published,
          "settings": @settings,
          "updated": @updated,
          "snippets": @snippets,
          "version": @version
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.created.is_a?(Integer) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.published.is_a?(Integer) != false || raise("Passed value for field obj.published is not the expected type, validation failed.")
        Brands::BrandSettings.validate_raw(obj: obj.settings)
        obj.updated.is_a?(Integer) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
        obj.snippets.nil? || Brands::BrandSnippets.validate_raw(obj: obj.snippets)
        obj.version.is_a?(String) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      end
    end
  end
end
