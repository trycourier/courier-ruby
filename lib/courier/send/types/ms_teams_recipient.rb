# frozen_string_literal: true

require_relative "../../profiles/types/ms_teams"
require "json"

module Courier
  class Send
    class MsTeamsRecipient
      attr_reader :ms_teams, :additional_properties

      # @param ms_teams [Profiles::MsTeams]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Send::MsTeamsRecipient]
      def initialize(ms_teams:, additional_properties: nil)
        # @type [Profiles::MsTeams]
        @ms_teams = ms_teams
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MsTeamsRecipient
      #
      # @param json_object [JSON]
      # @return [Send::MsTeamsRecipient]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["ms_teams"].nil?
          ms_teams = nil
        else
          ms_teams = parsed_json["ms_teams"].to_json
          ms_teams = Profiles::MsTeams.from_json(json_object: ms_teams)
        end
        new(ms_teams: ms_teams, additional_properties: struct)
      end

      # Serialize an instance of MsTeamsRecipient to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "ms_teams": @ms_teams }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Profiles::MsTeams.validate_raw(obj: obj.ms_teams)
      end
    end
  end
end
