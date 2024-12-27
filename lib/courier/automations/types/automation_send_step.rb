# frozen_string_literal: true

require "json"

module Courier
  class Automations
    class AutomationSendStep
      attr_reader :action, :brand, :data, :override, :profile, :recipient, :template, :if_, :ref, :additional_properties

      # @param action [String]
      # @param brand [String]
      # @param data [Hash{String => String}]
      # @param override [Hash{String => String}]
      # @param profile [Object]
      # @param recipient [String]
      # @param template [String]
      # @param if_ [String]
      # @param ref [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationSendStep]
      def initialize(action:, brand: nil, data: nil, override: nil, profile: nil, recipient: nil, template: nil,
                     if_: nil, ref: nil, additional_properties: nil)
        # @type [String]
        @action = action
        # @type [String]
        @brand = brand
        # @type [Hash{String => String}]
        @data = data
        # @type [Hash{String => String}]
        @override = override
        # @type [Object]
        @profile = profile
        # @type [String]
        @recipient = recipient
        # @type [String]
        @template = template
        # @type [String]
        @if_ = if_
        # @type [String]
        @ref = ref
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationSendStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationSendStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        action = struct.action
        brand = struct.brand
        data = struct.data
        override = struct.override
        profile = struct.profile
        recipient = struct.recipient
        template = struct.template
        if_ = struct.if
        ref = struct.ref
        new(action: action, brand: brand, data: data, override: override, profile: profile, recipient: recipient,
            template: template, if_: if_, ref: ref, additional_properties: struct)
      end

      # Serialize an instance of AutomationSendStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "action": @action,
          "brand": @brand,
          "data": @data,
          "override": @override,
          "profile": @profile,
          "recipient": @recipient,
          "template": @template,
          "if": @if_,
          "ref": @ref
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.action.is_a?(String) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
        obj.brand&.is_a?(String) != false || raise("Passed value for field obj.brand is not the expected type, validation failed.")
        obj.data&.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
        obj.override&.is_a?(Hash) != false || raise("Passed value for field obj.override is not the expected type, validation failed.")
        obj.profile&.is_a?(Object) != false || raise("Passed value for field obj.profile is not the expected type, validation failed.")
        obj.recipient&.is_a?(String) != false || raise("Passed value for field obj.recipient is not the expected type, validation failed.")
        obj.template&.is_a?(String) != false || raise("Passed value for field obj.template is not the expected type, validation failed.")
        obj.if_&.is_a?(String) != false || raise("Passed value for field obj.if_ is not the expected type, validation failed.")
        obj.ref&.is_a?(String) != false || raise("Passed value for field obj.ref is not the expected type, validation failed.")
      end
    end
  end
end
