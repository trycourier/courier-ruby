# frozen_string_literal: true

require_relative "message_data"
require_relative "audience_filter"
require "json"

module Courier
  class Send
    class AudienceRecipient
      attr_reader :audience_id, :data, :filters, :additional_properties

      # @param audience_id [String] A unique identifier associated with an Audience. A message will be sent to each user in the audience.
      # @param data [Send::MESSAGE_DATA]
      # @param filters [Array<Send::AudienceFilter>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::AudienceRecipient]
      def initialize(audience_id:, data: nil, filters: nil, additional_properties: nil)
        # @type [String] A unique identifier associated with an Audience. A message will be sent to each user in the audience.
        @audience_id = audience_id
        # @type [Send::MESSAGE_DATA]
        @data = data
        # @type [Array<Send::AudienceFilter>]
        @filters = filters
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AudienceRecipient
      #
      # @param json_object [JSON]
      # @return [Send::AudienceRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        audience_id = struct.audience_id
        data = struct.data
        filters = parsed_json["filters"]&.map do |v|
          v = v.to_json
          Send::AudienceFilter.from_json(json_object: v)
        end
        new(audience_id: audience_id, data: data, filters: filters, additional_properties: struct)
      end

      # Serialize an instance of AudienceRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "audience_id": @audience_id, "data": @data, "filters": @filters }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.audience_id.is_a?(String) != false || raise("Passed value for field obj.audience_id is not the expected type, validation failed.")
        obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.filters&.is_a?(Array) != false || raise("Passed value for field obj.filters is not the expected type, validation failed.")
      end
    end
  end
end
