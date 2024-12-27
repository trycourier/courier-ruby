# frozen_string_literal: true

require "json"

module Courier
  class Bulk
    class InboundBulkMessageV1
      attr_reader :brand, :data, :event, :locale, :override, :additional_properties

      # @param brand [String] A unique identifier that represents the brand that should be used
      #   for rendering the notification.
      # @param data [Hash{String => String}] JSON that includes any data you want to pass to a message template.
      #   The data will populate the corresponding template variables.
      # @param event [String]
      # @param locale [Hash{String => String}]
      # @param override [Object] JSON that is merged into the request sent by Courier to the provider
      #   to override properties or to gain access to features in the provider
      #   API that are not natively supported by Courier.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Bulk::InboundBulkMessageV1]
      def initialize(brand: nil, data: nil, event: nil, locale: nil, override: nil, additional_properties: nil)
        # @type [String] A unique identifier that represents the brand that should be used
        #   for rendering the notification.
        @brand = brand
        # @type [Hash{String => String}] JSON that includes any data you want to pass to a message template.
        #   The data will populate the corresponding template variables.
        @data = data
        # @type [String]
        @event = event
        # @type [Hash{String => String}]
        @locale = locale
        # @type [Object] JSON that is merged into the request sent by Courier to the provider
        #   to override properties or to gain access to features in the provider
        #   API that are not natively supported by Courier.
        @override = override
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of InboundBulkMessageV1
      #
      # @param json_object [JSON]
      # @return [Bulk::InboundBulkMessageV1]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        brand = struct.brand
        data = struct.data
        event = struct.event
        locale = struct.locale
        override = struct.override
        new(brand: brand, data: data, event: event, locale: locale, override: override, additional_properties: struct)
      end

      # Serialize an instance of InboundBulkMessageV1 to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "brand": @brand, "data": @data, "event": @event, "locale": @locale, "override": @override }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.brand&.is_a?(String) != false || raise("Passed value for field obj.brand is not the expected type, validation failed.")
        obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.event&.is_a?(String) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
        obj.locale&.is_a?(Hash) != false || raise("Passed value for field obj.locale is not the expected type, validation failed.")
        obj.override&.is_a?(Object) != false || raise("Passed value for field obj.override is not the expected type, validation failed.")
      end
    end
  end
end
