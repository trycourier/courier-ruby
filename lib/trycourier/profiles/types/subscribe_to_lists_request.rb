# frozen_string_literal: true

require_relative "subscribe_to_lists_request_list_object"
require "json"

module Courier
  class Profiles
    class SubscribeToListsRequest
      attr_reader :lists, :additional_properties

      # @param lists [Array<Profiles::SubscribeToListsRequestListObject>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Profiles::SubscribeToListsRequest]
      def initialize(lists:, additional_properties: nil)
        # @type [Array<Profiles::SubscribeToListsRequestListObject>]
        @lists = lists
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SubscribeToListsRequest
      #
      # @param json_object [JSON]
      # @return [Profiles::SubscribeToListsRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        lists = parsed_json["lists"]&.map do |v|
          v = v.to_json
          Profiles::SubscribeToListsRequestListObject.from_json(json_object: v)
        end
        new(lists: lists, additional_properties: struct)
      end

      # Serialize an instance of SubscribeToListsRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "lists": @lists }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.lists.is_a?(Array) != false || raise("Passed value for field obj.lists is not the expected type, validation failed.")
      end
    end
  end
end
