# frozen_string_literal: true

require_relative "../../commons/types/user_tenant_association"
require "json"

module Courier
  class Tenants
    class ListUsersForTenantResponse
      attr_reader :items, :has_more, :url, :next_url, :cursor, :type, :additional_properties

      # @param items [Array<Commons::UserTenantAssociation>]
      # @param has_more [Boolean] Set to true when there are more pages that can be retrieved.
      # @param url [String] A url that may be used to generate these results.
      # @param next_url [String] A url that may be used to generate fetch the next set of results.
      #   Defined only when `has_more` is set to true
      # @param cursor [String] A pointer to the next page of results. Defined
      #   only when `has_more` is set to true
      # @param type [String] Always set to `list`. Represents the type of this object.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Tenants::ListUsersForTenantResponse]
      def initialize(has_more:, url:, type:, items: nil, next_url: nil, cursor: nil, additional_properties: nil)
        # @type [Array<Commons::UserTenantAssociation>]
        @items = items
        # @type [Boolean] Set to true when there are more pages that can be retrieved.
        @has_more = has_more
        # @type [String] A url that may be used to generate these results.
        @url = url
        # @type [String] A url that may be used to generate fetch the next set of results.
        #   Defined only when `has_more` is set to true
        @next_url = next_url
        # @type [String] A pointer to the next page of results. Defined
        #   only when `has_more` is set to true
        @cursor = cursor
        # @type [String] Always set to `list`. Represents the type of this object.
        @type = type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ListUsersForTenantResponse
      #
      # @param json_object [JSON]
      # @return [Tenants::ListUsersForTenantResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        items = parsed_json["items"]&.map do |v|
          v = v.to_json
          Commons::UserTenantAssociation.from_json(json_object: v)
        end
        has_more = struct.has_more
        url = struct.url
        next_url = struct.next_url
        cursor = struct.cursor
        type = struct.type
        new(items: items, has_more: has_more, url: url, next_url: next_url, cursor: cursor, type: type,
            additional_properties: struct)
      end

      # Serialize an instance of ListUsersForTenantResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "items": @items,
          "has_more": @has_more,
          "url": @url,
          "next_url": @next_url,
          "cursor": @cursor,
          "type": @type
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.items&.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
        obj.has_more.is_a?(Boolean) != false || raise("Passed value for field obj.has_more is not the expected type, validation failed.")
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.next_url&.is_a?(String) != false || raise("Passed value for field obj.next_url is not the expected type, validation failed.")
        obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
