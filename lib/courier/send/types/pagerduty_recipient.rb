# frozen_string_literal: true

require_relative "../../profiles/types/pagerduty"
require "json"

module Courier
  class Send
    class PagerdutyRecipient
      attr_reader :pagerduty, :additional_properties

      # @param pagerduty [Profiles::Pagerduty]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::PagerdutyRecipient]
      def initialize(pagerduty:, additional_properties: nil)
        # @type [Profiles::Pagerduty]
        @pagerduty = pagerduty
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of PagerdutyRecipient
      #
      # @param json_object [JSON]
      # @return [Send::PagerdutyRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["pagerduty"].nil?
          pagerduty = nil
        else
          pagerduty = parsed_json["pagerduty"].to_json
          pagerduty = Profiles::Pagerduty.from_json(json_object: pagerduty)
        end
        new(pagerduty: pagerduty, additional_properties: struct)
      end

      # Serialize an instance of PagerdutyRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "pagerduty": @pagerduty }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Profiles::Pagerduty.validate_raw(obj: obj.pagerduty)
      end
    end
  end
end
