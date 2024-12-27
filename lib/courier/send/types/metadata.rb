# frozen_string_literal: true

require_relative "utm"
require "json"

module Courier
  class Send
    class Metadata
      attr_reader :utm, :additional_properties

      # @param utm [Send::Utm]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::Metadata]
      def initialize(utm: nil, additional_properties: nil)
        # @type [Send::Utm]
        @utm = utm
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Metadata
      #
      # @param json_object [JSON]
      # @return [Send::Metadata]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["utm"].nil?
          utm = nil
        else
          utm = parsed_json["utm"].to_json
          utm = Send::Utm.from_json(json_object: utm)
        end
        new(utm: utm, additional_properties: struct)
      end

      # Serialize an instance of Metadata to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "utm": @utm }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.utm.nil? || Send::Utm.validate_raw(obj: obj.utm)
      end
    end
  end
end
