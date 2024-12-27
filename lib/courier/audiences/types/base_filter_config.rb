# frozen_string_literal: true

require_relative "operator"
require "json"

module Courier
  class Audiences
    class BaseFilterConfig
      attr_reader :operator, :additional_properties

      # @param operator [Audiences::Operator] The operator to use for filtering
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Audiences::BaseFilterConfig]
      def initialize(operator:, additional_properties: nil)
        # @type [Audiences::Operator] The operator to use for filtering
        @operator = operator
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BaseFilterConfig
      #
      # @param json_object [JSON]
      # @return [Audiences::BaseFilterConfig]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["operator"].nil?
          operator = nil
        else
          operator = parsed_json["operator"].to_json
          operator = Audiences::Operator.from_json(json_object: operator)
        end
        new(operator: operator, additional_properties: struct)
      end

      # Serialize an instance of BaseFilterConfig to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "operator": @operator }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Audiences::Operator.validate_raw(obj: obj.operator)
      end
    end
  end
end
