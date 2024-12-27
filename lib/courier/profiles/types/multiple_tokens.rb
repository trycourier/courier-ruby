# frozen_string_literal: true

require_relative "token"
require "json"

module Courier
  class Profiles
    class MultipleTokens
      attr_reader :tokens, :additional_properties

      # @param tokens [Array<Profiles::Token>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::MultipleTokens]
      def initialize(tokens:, additional_properties: nil)
        # @type [Array<Profiles::Token>]
        @tokens = tokens
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MultipleTokens
      #
      # @param json_object [JSON]
      # @return [Profiles::MultipleTokens]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        tokens = parsed_json["tokens"]&.map do |v|
          v = v.to_json
          Profiles::Token.from_json(json_object: v)
        end
        new(tokens: tokens, additional_properties: struct)
      end

      # Serialize an instance of MultipleTokens to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "tokens": @tokens }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.tokens.is_a?(Array) != false || raise("Passed value for field obj.tokens is not the expected type, validation failed.")
      end
    end
  end
end
