# frozen_string_literal: true

require "json"
require_relative "send_to_ms_teams_user_id"
require_relative "send_to_ms_teams_email"
require_relative "send_to_ms_teams_channel_id"
require_relative "send_to_ms_teams_conversation_id"
require_relative "send_to_ms_teams_channel_name"

module Courier
  class Profiles
    class MsTeams
      attr_reader :member
      alias kind_of? is_a?
      # @param member [Object]
      # @return [Profiles::MsTeams]
      def initialize(member:)
        # @type [Object]
        @member = member
      end

      # Deserialize a JSON object to an instance of MsTeams
      #
      # @param json_object [JSON]
      # @return [Profiles::MsTeams]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Profiles::SendToMsTeamsUserId.validate_raw(obj: struct)
          member = Profiles::SendToMsTeamsUserId.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Profiles::SendToMsTeamsEmail.validate_raw(obj: struct)
          member = Profiles::SendToMsTeamsEmail.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Profiles::SendToMsTeamsChannelId.validate_raw(obj: struct)
          member = Profiles::SendToMsTeamsChannelId.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Profiles::SendToMsTeamsConversationId.validate_raw(obj: struct)
          member = Profiles::SendToMsTeamsConversationId.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          Profiles::SendToMsTeamsChannelName.validate_raw(obj: struct)
          member = Profiles::SendToMsTeamsChannelName.from_json(json_object: json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        new(member: struct)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [JSON]
      def to_json(*_args)
        @member.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Profiles::SendToMsTeamsUserId.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Profiles::SendToMsTeamsEmail.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Profiles::SendToMsTeamsChannelId.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Profiles::SendToMsTeamsConversationId.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Profiles::SendToMsTeamsChannelName.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end

      # For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object]
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end
    end
  end
end
