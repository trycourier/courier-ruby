# frozen_string_literal: true

module Courier
  module Models
    class JourneyAudienceTriggerNode < Courier::Internal::Type::BaseModel
      # @!attribute audience_id
      #   The Audience to watch. Must name a single Audience; wildcards are not supported.
      #
      #   @return [String]
      required :audience_id, String

      # @!attribute trigger_type
      #
      #   @return [Symbol, Courier::Models::JourneyAudienceTriggerNode::TriggerType]
      required :trigger_type, enum: -> { Courier::JourneyAudienceTriggerNode::TriggerType }

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyAudienceTriggerNode::Type]
      required :type, enum: -> { Courier::JourneyAudienceTriggerNode::Type }

      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute conditions
      #   Condition spec for a journey node. Accepts a single condition atom, an AND/OR
      #   group, or an AND/OR nested group. Omit the `conditions` property entirely to
      #   express "no conditions".
      #
      #   @return [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup, nil]
      optional :conditions, union: -> { Courier::JourneyConditionsField }

      # @!method initialize(audience_id:, trigger_type:, type:, id: nil, conditions: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyAudienceTriggerNode} for more details.
      #
      #   Trigger fired when a user newly matches an Audience. Leaving and re-joining the
      #   Audience re-enters the Journey. Membership is new-members-only: users already in
      #   the Audience when the Journey is published do not enter. Unlike the v2
      #   Automations audience trigger, there is no member scope, event type, or frequency
      #   mode to configure, and `audience_id` must name one Audience — wildcards are not
      #   supported.
      #
      #   @param audience_id [String] The Audience to watch. Must name a single Audience; wildcards are not supported.
      #
      #   @param trigger_type [Symbol, Courier::Models::JourneyAudienceTriggerNode::TriggerType]
      #
      #   @param type [Symbol, Courier::Models::JourneyAudienceTriggerNode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr

      # @see Courier::Models::JourneyAudienceTriggerNode#trigger_type
      module TriggerType
        extend Courier::Internal::Type::Enum

        AUDIENCE = :audience

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyAudienceTriggerNode#type
      module Type
        extend Courier::Internal::Type::Enum

        TRIGGER = :trigger

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
