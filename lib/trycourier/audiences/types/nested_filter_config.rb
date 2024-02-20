# frozen_string_literal: true

require_relative "filter_config"
require_relative "operator"
require "json"

module Courier
  class Audiences
    # The operator to use for filtering
    class NestedFilterConfig
      attr_reader :rules, :operator, :additional_properties

      # @param rules [Array<Audiences::FilterConfig>]
      # @param operator [Audiences::Operator] The operator to use for filtering
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Audiences::NestedFilterConfig]
      def initialize(rules:, operator:, additional_properties: nil)
        # @type [Array<Audiences::FilterConfig>]
        @rules = rules
        # @type [Audiences::Operator] The operator to use for filtering
        @operator = operator
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of NestedFilterConfig
      #
      # @param json_object [JSON]
      # @return [Audiences::NestedFilterConfig]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        rules = parsed_json["rules"]&.map do |v|
          v = v.to_json
          Audiences::FilterConfig.from_json(json_object: v)
        end
        if parsed_json["operator"].nil?
          operator = nil
        else
          operator = parsed_json["operator"].to_json
          operator = Audiences::Operator.from_json(json_object: operator)
        end
        new(rules: rules, operator: operator, additional_properties: struct)
      end

      # Serialize an instance of NestedFilterConfig to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "rules": @rules, "operator": @operator }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.rules.is_a?(Array) != false || raise("Passed value for field obj.rules is not the expected type, validation failed.")
        Audiences::Operator.validate_raw(obj: obj.operator)
      end
    end
  end
end
