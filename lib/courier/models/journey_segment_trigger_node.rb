# frozen_string_literal: true

module Courier
  module Models
    class JourneySegmentTriggerNode < Courier::Internal::Type::BaseModel
      # @!attribute request_type
      #
      #   @return [Symbol, Courier::Models::JourneySegmentTriggerNode::RequestType]
      required :request_type, enum: -> { Courier::JourneySegmentTriggerNode::RequestType }

      # @!attribute trigger_type
      #
      #   @return [Symbol, Courier::Models::JourneySegmentTriggerNode::TriggerType]
      required :trigger_type, enum: -> { Courier::JourneySegmentTriggerNode::TriggerType }

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneySegmentTriggerNode::Type]
      required :type, enum: -> { Courier::JourneySegmentTriggerNode::Type }

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

      # @!attribute event_id
      #
      #   @return [String, nil]
      optional :event_id, String

      # @!method initialize(request_type:, trigger_type:, type:, id: nil, conditions: nil, event_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneySegmentTriggerNode} for more details.
      #
      #   Trigger fired by a segment event (`identify`, `group`, or `track`).
      #
      #   @param request_type [Symbol, Courier::Models::JourneySegmentTriggerNode::RequestType]
      #
      #   @param trigger_type [Symbol, Courier::Models::JourneySegmentTriggerNode::TriggerType]
      #
      #   @param type [Symbol, Courier::Models::JourneySegmentTriggerNode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr
      #
      #   @param event_id [String]

      # @see Courier::Models::JourneySegmentTriggerNode#request_type
      module RequestType
        extend Courier::Internal::Type::Enum

        IDENTIFY = :identify
        GROUP = :group
        TRACK = :track

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneySegmentTriggerNode#trigger_type
      module TriggerType
        extend Courier::Internal::Type::Enum

        SEGMENT = :segment

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneySegmentTriggerNode#type
      module Type
        extend Courier::Internal::Type::Enum

        TRIGGER = :trigger

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
