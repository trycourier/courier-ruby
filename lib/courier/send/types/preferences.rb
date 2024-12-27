# frozen_string_literal: true

require "json"

module Courier
  class Send
    class Preferences
      attr_reader :template_ids, :additional_properties

      # @param template_ids [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Preferences]
      def initialize(template_ids:, additional_properties: nil)
        # @type [Array<String>]
        @template_ids = template_ids
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Preferences
      #
      # @param json_object [JSON]
      # @return [Send::Preferences]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        template_ids = struct.templateIds
        new(template_ids: template_ids, additional_properties: struct)
      end

      # Serialize an instance of Preferences to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "templateIds": @template_ids }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.template_ids.is_a?(Array) != false || raise("Passed value for field obj.template_ids is not the expected type, validation failed.")
      end
    end
  end
end
