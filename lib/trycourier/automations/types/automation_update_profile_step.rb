# frozen_string_literal: true

require_relative "profile"
require_relative "merge_algorithm"
require "json"

module Courier
  class Automations
    class AutomationUpdateProfileStep
      attr_reader :action, :recipient_id, :profile, :merge, :additional_properties

      # @param action [String]
      # @param recipient_id [String]
      # @param profile [Automations::PROFILE]
      # @param merge [MERGE_ALGORITHM]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Automations::AutomationUpdateProfileStep]
      def initialize(action:, recipient_id:, profile:, merge:, additional_properties: nil)
        # @type [String]
        @action = action
        # @type [String]
        @recipient_id = recipient_id
        # @type [Automations::PROFILE]
        @profile = profile
        # @type [MERGE_ALGORITHM]
        @merge = merge
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AutomationUpdateProfileStep
      #
      # @param json_object [JSON]
      # @return [Automations::AutomationUpdateProfileStep]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        action = struct.action
        recipient_id = struct.recipient_id
        profile = struct.profile
        merge = Automations::MERGE_ALGORITHM.key(parsed_json["merge"]) || parsed_json["merge"]
        new(action: action, recipient_id: recipient_id, profile: profile, merge: merge, additional_properties: struct)
      end

      # Serialize an instance of AutomationUpdateProfileStep to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "action": @action,
          "recipient_id": @recipient_id,
          "profile": @profile,
          "merge": Automations::MERGE_ALGORITHM[@merge] || @merge
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.action.is_a?(String) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
        obj.recipient_id.is_a?(String) != false || raise("Passed value for field obj.recipient_id is not the expected type, validation failed.")
        obj.profile.is_a?(Object) != false || raise("Passed value for field obj.profile is not the expected type, validation failed.")
        obj.merge.is_a?(Automations::MERGE_ALGORITHM) != false || raise("Passed value for field obj.merge is not the expected type, validation failed.")
      end
    end
  end
end
