# frozen_string_literal: true

require "json"

module Courier
  class Send
    class BaseSocialPresence
      attr_reader :url, :additional_properties

      # @param url [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::BaseSocialPresence]
      def initialize(url:, additional_properties: nil)
        # @type [String]
        @url = url
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BaseSocialPresence
      #
      # @param json_object [JSON]
      # @return [Send::BaseSocialPresence]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        url = struct.url
        new(url: url, additional_properties: struct)
      end

      # Serialize an instance of BaseSocialPresence to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "url": @url }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      end
    end
  end
end
