# frozen_string_literal: true

require_relative "message_data"
require_relative "list_filter"
require "json"

module Courier
  class Send
    class ListRecipient
      attr_reader :list_id, :data, :filters, :additional_properties

      # @param list_id [String]
      # @param data [Send::MESSAGE_DATA]
      # @param filters [Array<Send::ListFilter>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::ListRecipient]
      def initialize(list_id: nil, data: nil, filters: nil, additional_properties: nil)
        # @type [String]
        @list_id = list_id
        # @type [Send::MESSAGE_DATA]
        @data = data
        # @type [Array<Send::ListFilter>]
        @filters = filters
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ListRecipient
      #
      # @param json_object [JSON]
      # @return [Send::ListRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        list_id = struct.list_id
        data = struct.data
        filters = parsed_json["filters"]&.map do |v|
          v = v.to_json
          Send::ListFilter.from_json(json_object: v)
        end
        new(list_id: list_id, data: data, filters: filters, additional_properties: struct)
      end

      # Serialize an instance of ListRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "list_id": @list_id, "data": @data, "filters": @filters }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.list_id&.is_a?(String) != false || raise("Passed value for field obj.list_id is not the expected type, validation failed.")
        obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.filters&.is_a?(Array) != false || raise("Passed value for field obj.filters is not the expected type, validation failed.")
      end
    end
  end
end
