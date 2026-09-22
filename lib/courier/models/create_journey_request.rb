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
      #   @return [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneyAudienceTriggerNode, Courier::Models::JourneyWebhookTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyNode::JourneyBatchNode, Courier::Models::JourneyNode::JourneyAddToDigestNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>]
      required :nodes, -> { Courier::Internal::Type::ArrayOf[union: Courier::JourneyNode] }

      # @!attribute cancelation_token
      #   Cancelation token stored on the journey definition. It tags every run the
      #   journey creates so that `POST /journeys/cancel` can later cancel those runs by
      #   token. Accepts a templated string such as `order-{{data.order_id}}`, which is
      #   resolved per run when the journey is invoked. On a replace, omitting this field
      #   preserves any existing token and sending a value replaces it.
      #
      #   @return [String, nil]
      optional :cancelation_token, String

      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, Courier::Internal::Type::Boolean

      # @!attribute state
      #   Lifecycle state of a journey.
      #
      #   @return [Symbol, Courier::Models::JourneyState, nil]
      optional :state, enum: -> { Courier::JourneyState }

      # @!method initialize(name:, nodes:, cancelation_token: nil, enabled: nil, state: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::CreateJourneyRequest} for more details.
      #
      #   Request body for creating a journey.
      #
      #   @param name [String]
      #
      #   @param nodes [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneyAudienceTriggerNode, Courier::Models::JourneyWebhookTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyNode::JourneyBatchNode, Courier::Models::JourneyNode::JourneyAddToDigestNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>]
      #
      #   @param cancelation_token [String] Cancelation token stored on the journey definition. It tags every run the journe
      #
      #   @param enabled [Boolean]
      #
      #   @param state [Symbol, Courier::Models::JourneyState] Lifecycle state of a journey.
    end
  end
end
