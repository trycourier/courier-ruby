# frozen_string_literal: true

require "json"
require_relative "audience_recipient"
require_relative "list_recipient"
require_relative "list_pattern_recipient"
require_relative "user_recipient"
require_relative "slack_recipient"
require_relative "ms_teams_recipient"

module Courier
  class Send
    class Recipient
      # Deserialize a JSON object to an instance of Recipient
      #
      # @param json_object [JSON]
      # @return [Send::Recipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Send::AudienceRecipient.validate_raw(obj: struct)
          return Send::AudienceRecipient.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Send::ListRecipient.validate_raw(obj: struct)
          return Send::ListRecipient.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Send::ListPatternRecipient.validate_raw(obj: struct)
          return Send::ListPatternRecipient.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Send::UserRecipient.validate_raw(obj: struct)
          return Send::UserRecipient.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Send::SlackRecipient.validate_raw(obj: struct)
          return Send::SlackRecipient.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Send::MsTeamsRecipient.validate_raw(obj: struct)
          return Send::MsTeamsRecipient.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Send::AudienceRecipient.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Send::ListRecipient.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Send::ListPatternRecipient.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Send::UserRecipient.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Send::SlackRecipient.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Send::MsTeamsRecipient.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
