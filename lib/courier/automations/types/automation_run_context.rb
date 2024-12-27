# frozen_string_literal: true

require_relative "profile"
require "json"

module Courier
  class Automations
    class AutomationRunContext
      attr_reader :brand, :data, :profile, :template, :recipient, :additional_properties

      # @param brand [String]
      # @param data [Object]
      # @param profile [Automations::PROFILE]
      # @param template [String]
      # @param recipient [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationRunContext]
      def initialize(brand: nil, data: nil, profile: nil, template: nil, recipient: nil, additional_properties: nil)
        # @type [String]
        @brand = brand
        # @type [Object]
        @data = data
        # @type [Automations::PROFILE]
        @profile = profile
        # @type [String]
        @template = template
        # @type [String]
        @recipient = recipient
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationRunContext
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationRunContext]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        brand = struct.brand
        data = struct.data
        profile = struct.profile
        template = struct.template
        recipient = struct.recipient
        new(brand: brand, data: data, profile: profile, template: template, recipient: recipient,
            additional_properties: struct)
      end

      # Serialize an instance of AutomationRunContext to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "brand": @brand, "data": @data, "profile": @profile, "template": @template, "recipient": @recipient }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.brand&.is_a?(String) != false || raise("Passed value for field obj.brand is not the expected type, validation failed.")
        obj.data&.is_a?(Object) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.profile&.is_a?(Object) != false || raise("Passed value for field obj.profile is not the expected type, validation failed.")
        obj.template&.is_a?(String) != false || raise("Passed value for field obj.template is not the expected type, validation failed.")
        obj.recipient&.is_a?(String) != false || raise("Passed value for field obj.recipient is not the expected type, validation failed.")
      end
    end
  end
end
