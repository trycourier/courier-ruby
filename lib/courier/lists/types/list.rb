# frozen_string_literal: true

require "json"

module Courier
  class Lists
    class List
      attr_reader :id, :name, :created, :updated, :additional_properties

      # @param id [String]
      # @param name [String]
      # @param created [Integer]
      # @param updated [Integer]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Lists::List]
      def initialize(id:, name:, created: nil, updated: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String]
        @name = name
        # @type [Integer]
        @created = created
        # @type [Integer]
        @updated = updated
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of List
      #
      # @param json_object [JSON]
      # @return [Lists::List]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        id = struct.id
        name = struct.name
        created = struct.created
        updated = struct.updated
        new(id: id, name: name, created: created, updated: updated, additional_properties: struct)
      end

      # Serialize an instance of List to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "id": @id, "name": @name, "created": @created, "updated": @updated }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.created&.is_a?(Integer) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
        obj.updated&.is_a?(Integer) != false || raise("Passed value for field obj.updated is not the expected type, validation failed.")
      end
    end
  end
end
