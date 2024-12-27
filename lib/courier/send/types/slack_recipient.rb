# frozen_string_literal: true

require_relative "../../profiles/types/slack"
require "json"

module Courier
  class Send
    class SlackRecipient
      attr_reader :slack, :additional_properties

      # @param slack [Profiles::Slack]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::SlackRecipient]
      def initialize(slack:, additional_properties: nil)
        # @type [Profiles::Slack]
        @slack = slack
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of SlackRecipient
      #
      # @param json_object [JSON]
      # @return [Send::SlackRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["slack"].nil?
          slack = nil
        else
          slack = parsed_json["slack"].to_json
          slack = Profiles::Slack.from_json(json_object: slack)
        end
        new(slack: slack, additional_properties: struct)
      end

      # Serialize an instance of SlackRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "slack": @slack }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Profiles::Slack.validate_raw(obj: obj.slack)
      end
    end
  end
end
