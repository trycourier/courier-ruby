# frozen_string_literal: true

require "json"
require_relative "inbound_bulk_template_message"
require_relative "inbound_bulk_content_message"

module Courier
  class Bulk
    class InboundBulkMessageV2
      # Deserialize a JSON object to an instance of InboundBulkMessageV2
      #
      # @param json_object [JSON]
      # @return [Bulk::InboundBulkMessageV2]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Bulk::InboundBulkTemplateMessage.validate_raw(obj: struct)
          return Bulk::InboundBulkTemplateMessage.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Bulk::InboundBulkContentMessage.validate_raw(obj: struct)
          return Bulk::InboundBulkContentMessage.from_json(json_object: json_object)
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
          return Bulk::InboundBulkTemplateMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Bulk::InboundBulkContentMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
