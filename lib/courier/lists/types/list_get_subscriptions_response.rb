# frozen_string_literal: true

require_relative "../../commons/types/paging"
require_relative "list_subscription_recipient"
require "json"

module Courier
  class Lists
    class ListGetSubscriptionsResponse
      attr_reader :paging, :items, :additional_properties

      # @param paging [Commons::Paging]
      # @param items [Array<Lists::ListSubscriptionRecipient>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Lists::ListGetSubscriptionsResponse]
      def initialize(paging:, items:, additional_properties: nil)
        # @type [Commons::Paging]
        @paging = paging
        # @type [Array<Lists::ListSubscriptionRecipient>]
        @items = items
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ListGetSubscriptionsResponse
      #
      # @param json_object [JSON]
      # @return [Lists::ListGetSubscriptionsResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["paging"].nil?
          paging = nil
        else
          paging = parsed_json["paging"].to_json
          paging = Commons::Paging.from_json(json_object: paging)
        end
        items = parsed_json["items"]&.map do |v|
          v = v.to_json
          Lists::ListSubscriptionRecipient.from_json(json_object: v)
        end
        new(paging: paging, items: items, additional_properties: struct)
      end

      # Serialize an instance of ListGetSubscriptionsResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "paging": @paging, "items": @items }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Commons::Paging.validate_raw(obj: obj.paging)
        obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
      end
    end
  end
end
