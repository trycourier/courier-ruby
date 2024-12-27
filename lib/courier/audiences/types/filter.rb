# frozen_string_literal: true

require "json"
require_relative "single_filter_config"
require_relative "nested_filter_config"

module Courier
  class Audiences
    class Filter
      # Deserialize a JSON object to an instance of Filter
      #
      # @param json_object [JSON]
      # @return [Audiences::Filter]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Audiences::SingleFilterConfig.validate_raw(obj: struct)
          return Audiences::SingleFilterConfig.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Audiences::NestedFilterConfig.validate_raw(obj: struct)
          return Audiences::NestedFilterConfig.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Audiences::SingleFilterConfig.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Audiences::NestedFilterConfig.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
