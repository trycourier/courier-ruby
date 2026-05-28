# frozen_string_literal: true

module Courier
  module Models
    class CreateJourneyRequest < Courier::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute nodes
      #
      #   @return [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyNode::JourneyBatchNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>]
      required :nodes, -> { Courier::Internal::Type::ArrayOf[union: Courier::JourneyNode] }

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, Courier::Internal::Type::Boolean

      # @!attribute state
      #   Lifecycle state of a journey.
      #
      #   @return [Symbol, Courier::Models::JourneyState, nil]
      optional :state, enum: -> { Courier::JourneyState }

      # @!method initialize(name:, nodes:, enabled: nil, state: nil)
      #   Request body for creating a journey.
      #
      #   @param name [String]
      #
      #   @param nodes [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyNode::JourneyBatchNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>]
      #
      #   @param enabled [Boolean]
      #
      #   @param state [Symbol, Courier::Models::JourneyState] Lifecycle state of a journey.
    end
  end
end
