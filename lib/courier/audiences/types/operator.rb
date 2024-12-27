# frozen_string_literal: true

require "json"

module Courier
  class Audiences
    class Operator
      # Deserialize a JSON object to an instance of Operator
      #
      # @param json_object [JSON]
      # @return [Audiences::Operator]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          struct.is_a?(Audiences::ComparisonOperator) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          return json_object
        rescue StandardError
          # noop
        end
        begin
          struct.is_a?(Audiences::LogicalOperator) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          return json_object
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
          return obj.is_a?(Audiences::ComparisonOperator) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        begin
          return obj.is_a?(Audiences::LogicalOperator) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
