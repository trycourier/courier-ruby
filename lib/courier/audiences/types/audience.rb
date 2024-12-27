# frozen_string_literal: true

require_relative "filter"
require "json"

module Courier
  class Audiences
    class Audience
      attr_reader :id, :name, :description, :filter, :created_at, :updated_at, :additional_properties

      # @param id [String] A unique identifier representing the audience_id
      # @param name [String] The name of the audience
      # @param description [String] A description of the audience
      # @param filter [Audiences::Filter]
      # @param created_at [String]
      # @param updated_at [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Audiences::Audience]
      def initialize(id:, name:, description:, filter:, created_at:, updated_at:, additional_properties: nil)
        # @type [String] A unique identifier representing the audience_id
        @id = id
        # @type [String] The name of the audience
        @name = name
        # @type [String] A description of the audience
        @description = description
        # @type [Audiences::Filter]
        @filter = filter
        # @type [String]
        @created_at = created_at
        # @type [String]
        @updated_at = updated_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Audience
      #
      # @param json_object [JSON]
      # @return [Audiences::Audience]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        name = struct.name
        description = struct.description
        if parsed_json["filter"].nil?
          filter = nil
        else
          filter = parsed_json["filter"].to_json
          filter = Audiences::Filter.from_json(json_object: filter)
        end
        created_at = struct.created_at
        updated_at = struct.updated_at
        new(id: id, name: name, description: description, filter: filter, created_at: created_at,
            updated_at: updated_at, additional_properties: struct)
      end

      # Serialize an instance of Audience to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "name": @name,
          "description": @description,
          "filter": @filter,
          "created_at": @created_at,
          "updated_at": @updated_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        Audiences::Filter.validate_raw(obj: obj.filter)
        obj.created_at.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.updated_at.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      end
    end
  end
end
