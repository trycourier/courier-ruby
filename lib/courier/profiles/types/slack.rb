# frozen_string_literal: true

require "json"
require_relative "send_to_slack_channel"
require_relative "send_to_slack_email"
require_relative "send_to_slack_user_id"

module Courier
  class Profiles
    class Slack
      # Deserialize a JSON object to an instance of Slack
      #
      # @param json_object [JSON]
      # @return [Profiles::Slack]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Profiles::SendToSlackChannel.validate_raw(obj: struct)
          return Profiles::SendToSlackChannel.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Profiles::SendToSlackEmail.validate_raw(obj: struct)
          return Profiles::SendToSlackEmail.from_json(json_object: json_object)
        rescue StandardError
          # noop
        end
        begin
          Profiles::SendToSlackUserId.validate_raw(obj: struct)
          return Profiles::SendToSlackUserId.from_json(json_object: json_object)
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
          return Profiles::SendToSlackChannel.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Profiles::SendToSlackEmail.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Profiles::SendToSlackUserId.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
