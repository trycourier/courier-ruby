# frozen_string_literal: true

require "json"

module Courier
  class Send
    class TrackingOverride
      attr_reader :open, :additional_properties

      # @param open [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::TrackingOverride]
      def initialize(open:, additional_properties: nil)
        # @type [Boolean]
        @open = open
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of TrackingOverride
      #
      # @param json_object [JSON]
      # @return [Send::TrackingOverride]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        open = struct.open
        new(open: open, additional_properties: struct)
      end

      # Serialize an instance of TrackingOverride to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "open": @open }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.open.is_a?(Boolean) != false || raise("Passed value for field obj.open is not the expected type, validation failed.")
      end
    end
  end
end
