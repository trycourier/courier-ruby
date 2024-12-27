# frozen_string_literal: true

require "json"

module Courier
  class Send
    class Icons
      attr_reader :bell, :message, :additional_properties

      # @param bell [String]
      # @param message [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Icons]
      def initialize(bell: nil, message: nil, additional_properties: nil)
        # @type [String]
        @bell = bell
        # @type [String]
        @message = message
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Icons
      #
      # @param json_object [JSON]
      # @return [Send::Icons]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        bell = struct.bell
        message = struct.message
        new(bell: bell, message: message, additional_properties: struct)
      end

      # Serialize an instance of Icons to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "bell": @bell, "message": @message }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.bell&.is_a?(String) != false || raise("Passed value for field obj.bell is not the expected type, validation failed.")
        obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      end
    end
  end
end
