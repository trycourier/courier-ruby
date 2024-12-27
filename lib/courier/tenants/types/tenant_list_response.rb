# frozen_string_literal: true

require_relative "tenant"
require "json"

module Courier
  class Tenants
    class TenantListResponse
      attr_reader :cursor, :has_more, :items, :next_url, :url, :type, :additional_properties

      # @param cursor [String] A pointer to the next page of results. Defined only when has_more is set to true.
      # @param has_more [Boolean] Set to true when there are more pages that can be retrieved.
      # @param items [Array<Tenants::Tenant>] An array of Tenants
      # @param next_url [String] A url that may be used to generate fetch the next set of results.
      #   Defined only when has_more is set to true
      # @param url [String] A url that may be used to generate these results.
      # @param type [String] Always set to "list". Represents the type of this object.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Tenants::TenantListResponse]
      def initialize(has_more:, items:, url:, type:, cursor: nil, next_url: nil, additional_properties: nil)
        # @type [String] A pointer to the next page of results. Defined only when has_more is set to true.
        @cursor = cursor
        # @type [Boolean] Set to true when there are more pages that can be retrieved.
        @has_more = has_more
        # @type [Array<Tenants::Tenant>] An array of Tenants
        @items = items
        # @type [String] A url that may be used to generate fetch the next set of results.
        #   Defined only when has_more is set to true
        @next_url = next_url
        # @type [String] A url that may be used to generate these results.
        @url = url
        # @type [String] Always set to "list". Represents the type of this object.
        @type = type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of TenantListResponse
      #
      # @param json_object [JSON]
      # @return [Tenants::TenantListResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        cursor = struct.cursor
        has_more = struct.has_more
        items = parsed_json["items"]&.map do |v|
          v = v.to_json
          Tenants::Tenant.from_json(json_object: v)
        end
        next_url = struct.next_url
        url = struct.url
        type = struct.type
        new(cursor: cursor, has_more: has_more, items: items, next_url: next_url, url: url, type: type,
            additional_properties: struct)
      end

      # Serialize an instance of TenantListResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "cursor": @cursor,
          "has_more": @has_more,
          "items": @items,
          "next_url": @next_url,
          "url": @url,
          "type": @type
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
        obj.has_more.is_a?(Boolean) != false || raise("Passed value for field obj.has_more is not the expected type, validation failed.")
        obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
        obj.next_url&.is_a?(String) != false || raise("Passed value for field obj.next_url is not the expected type, validation failed.")
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
