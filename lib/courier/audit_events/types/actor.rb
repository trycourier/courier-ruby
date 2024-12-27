# frozen_string_literal: true

require "json"

module Courier
  class AuditEvents
    class Actor
      attr_reader :id, :email, :additional_properties

      # @param id [String]
      # @param email [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [AuditEvents::Actor]
      def initialize(id: nil, email: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String]
        @email = email
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Actor
      #
      # @param json_object [JSON]
      # @return [AuditEvents::Actor]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        id = struct.id
        email = struct.email
        new(id: id, email: email, additional_properties: struct)
      end

      # Serialize an instance of Actor to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "id": @id, "email": @email }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      end
    end
  end
end
