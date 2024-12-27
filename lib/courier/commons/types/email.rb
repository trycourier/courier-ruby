# frozen_string_literal: true

require "json"

module Courier
  class Commons
    class Email
      attr_reader :footer, :header, :additional_properties

      # @param footer [Object]
      # @param header [Object]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::Email]
      def initialize(footer:, header:, additional_properties: nil)
        # @type [Object]
        @footer = footer
        # @type [Object]
        @header = header
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Email
      #
      # @param json_object [JSON]
      # @return [Commons::Email]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        footer = struct.footer
        header = struct.header
        new(footer: footer, header: header, additional_properties: struct)
      end

      # Serialize an instance of Email to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "footer": @footer, "header": @header }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.footer.is_a?(Object) != false || raise("Passed value for field obj.footer is not the expected type, validation failed.")
        obj.header.is_a?(Object) != false || raise("Passed value for field obj.header is not the expected type, validation failed.")
      end
    end
  end
end
