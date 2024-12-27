# frozen_string_literal: true

require "json"
require_relative "elemental_content"
require_relative "elemental_content_sugar"

module Courier
  class Send
    class Content
      # Deserialize a JSON object to an instance of Content
      #
      # @param json_object [JSON]
      # @return [Send::Content]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Send::ElementalContent.validate_raw(obj: struct)
          return Send::ElementalContent.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Send::ElementalContentSugar.validate_raw(obj: struct)
          return Send::ElementalContentSugar.from_json(json_object: json_object)
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
          return Send::ElementalContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Send::ElementalContentSugar.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
