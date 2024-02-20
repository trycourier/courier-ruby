# frozen_string_literal: true

require_relative "profile"
require "json"

module Courier
  class Automations
    class AutomationInvokeTemplateParams
      attr_reader :template_id, :brand, :data, :profile, :recipient, :template, :additional_properties

      # @param template_id [String]
      # @param brand [String]
      # @param data [Hash{String => String}]
      # @param profile [Automations::PROFILE]
      # @param recipient [String]
      # @param template [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationInvokeTemplateParams]
      def initialize(template_id:, brand: nil, data: nil, profile: nil, recipient: nil, template: nil,
                     additional_properties: nil)
        # @type [String]
        @template_id = template_id
        # @type [String]
        @brand = brand
        # @type [Hash{String => String}]
        @data = data
        # @type [Automations::PROFILE]
        @profile = profile
        # @type [String]
        @recipient = recipient
        # @type [String]
        @template = template
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationInvokeTemplateParams
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationInvokeTemplateParams]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        template_id = struct.templateId
        brand = struct.brand
        data = struct.data
        profile = struct.profile
        recipient = struct.recipient
        template = struct.template
        new(template_id: template_id, brand: brand, data: data, profile: profile, recipient: recipient,
            template: template, additional_properties: struct)
      end

      # Serialize an instance of AutomationInvokeTemplateParams to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "templateId": @template_id,
          "brand": @brand,
          "data": @data,
          "profile": @profile,
          "recipient": @recipient,
          "template": @template
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.template_id.is_a?(String) != false || raise("Passed value for field obj.template_id is not the expected type, validation failed.")
        obj.brand&.is_a?(String) != false || raise("Passed value for field obj.brand is not the expected type, validation failed.")
        obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.profile&.is_a?(Object) != false || raise("Passed value for field obj.profile is not the expected type, validation failed.")
        obj.recipient&.is_a?(String) != false || raise("Passed value for field obj.recipient is not the expected type, validation failed.")
        obj.template&.is_a?(String) != false || raise("Passed value for field obj.template is not the expected type, validation failed.")
      end
    end
  end
end
