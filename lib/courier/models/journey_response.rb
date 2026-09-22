# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Journeys#create
    class JourneyResponse < Courier::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute cancelation_token
      #   The journey cancelation token, or null when none is set. A token authored in the
      #   dashboard is returned in its raw templated form, such as
      #   `order-{{data.order_id}}`, so it can be read back and asserted.
      #
      #   @return [String, nil]
      required :cancelation_token, String, nil?: true

      # @!attribute created
      #
      #   @return [Integer, nil]
      required :created, Integer, nil?: true

      # @!attribute creator
      #
      #   @return [String, nil]
      required :creator, String, nil?: true

      # @!attribute enabled
      #
      #   @return [Boolean]
      required :enabled, Courier::Internal::Type::Boolean

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute nodes
      #
      #   @return [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneyAudienceTriggerNode, Courier::Models::JourneyWebhookTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyNode::JourneyBatchNode, Courier::Models::JourneyNode::JourneyAddToDigestNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>]
      required :nodes, -> { Courier::Internal::Type::ArrayOf[union: Courier::JourneyNode] }

      # @!attribute published
      #
      #   @return [Integer, nil]
      required :published, Integer, nil?: true

      # @!attribute state
      #   Lifecycle state of a journey.
      #
      #   @return [Symbol, Courier::Models::JourneyState]
      required :state, enum: -> { Courier::JourneyState }

      # @!attribute updated
      #
      #   @return [Integer, nil]
      required :updated, Integer, nil?: true

      # @!attribute updater
      #
      #   @return [String, nil]
      required :updater, String, nil?: true

      # @!method initialize(id:, cancelation_token:, created:, creator:, enabled:, name:, nodes:, published:, state:, updated:, updater:)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyResponse} for more details.
      #
      #   A journey, with its current draft or published nodes and metadata.
      #
      #   @param id [String]
      #
      #   @param cancelation_token [String, nil] The journey cancelation token, or null when none is set. A token authored in the
      #
      #   @param created [Integer, nil]
      #
      #   @param creator [String, nil]
      #
      #   @param enabled [Boolean]
      #
      #   @param name [String]
      #
      #   @param nodes [Array<Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneyAudienceTriggerNode, Courier::Models::JourneyWebhookTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyNode::JourneyBatchNode, Courier::Models::JourneyNode::JourneyAddToDigestNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode>]
      #
      #   @param published [Integer, nil]
      #
      #   @param state [Symbol, Courier::Models::JourneyState] Lifecycle state of a journey.
      #
      #   @param updated [Integer, nil]
      #
      #   @param updater [String, nil]
    end
  end
end
