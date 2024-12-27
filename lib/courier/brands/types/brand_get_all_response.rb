# frozen_string_literal: true

require_relative "../../commons/types/paging"
require_relative "brand"
require "json"

module Courier
  class Brands
    class BrandGetAllResponse
      attr_reader :paging, :results, :additional_properties

      # @param paging [Commons::Paging]
      # @param results [Array<Brands::Brand>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Brands::BrandGetAllResponse]
      def initialize(paging:, results:, additional_properties: nil)
        # @type [Commons::Paging]
        @paging = paging
        # @type [Array<Brands::Brand>]
        @results = results
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BrandGetAllResponse
      #
      # @param json_object [JSON]
      # @return [Brands::BrandGetAllResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["paging"].nil?
          paging = nil
        else
          paging = parsed_json["paging"].to_json
          paging = Commons::Paging.from_json(json_object: paging)
        end
        results = parsed_json["results"]&.map do |v|
          v = v.to_json
          Brands::Brand.from_json(json_object: v)
        end
        new(paging: paging, results: results, additional_properties: struct)
      end

      # Serialize an instance of BrandGetAllResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "paging": @paging, "results": @results }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Commons::Paging.validate_raw(obj: obj.paging)
        obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      end
    end
  end
end
