# frozen_string_literal: true

require "json"
require_relative "token"
require_relative "multiple_tokens"

module Courier
  class Profiles
    class Expo
      # Deserialize a JSON object to an instance of Expo
      #
      # @param json_object [JSON]
      # @return [Profiles::Expo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Profiles::Token.validate_raw(obj: struct)
          return Profiles::Token.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Profiles::MultipleTokens.validate_raw(obj: struct)
          return Profiles::MultipleTokens.from_json(json_object: json_object)
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
          return Profiles::Token.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Profiles::MultipleTokens.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
