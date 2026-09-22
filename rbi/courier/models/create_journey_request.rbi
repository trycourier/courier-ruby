# typed: strong

module Courier
  module Models
    class CreateJourneyRequest < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::CreateJourneyRequest, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig do
        returns(
          T::Array[
            T.any(
              Courier::JourneyAPIInvokeTriggerNode,
              Courier::JourneySegmentTriggerNode,
              Courier::JourneyAudienceTriggerNode,
              Courier::JourneyWebhookTriggerNode,
              Courier::JourneySendNode,
              Courier::JourneyDelayDurationNode,
              Courier::JourneyDelayUntilNode,
              Courier::JourneyFetchGetDeleteNode,
              Courier::JourneyFetchPostPutNode,
              Courier::JourneyAINode,
              Courier::JourneyThrottleStaticNode,
              Courier::JourneyThrottleDynamicNode,
              Courier::JourneyNode::JourneyBatchNode,
              Courier::JourneyNode::JourneyAddToDigestNode,
              Courier::JourneyExitNode,
              Courier::JourneyNode::JourneyBranchNode
            )
          ]
        )
      end
      attr_accessor :nodes

      # Cancelation token stored on the journey definition. It tags every run the
      # journey creates so that `POST /journeys/cancel` can later cancel those runs by
      # token. Accepts a templated string such as `order-{{data.order_id}}`, which is
      # resolved per run when the journey is invoked. On a replace, omitting this field
      # preserves any existing token and sending a value replaces it.
      sig { returns(T.nilable(String)) }
      attr_reader :cancelation_token

      sig { params(cancelation_token: String).void }
      attr_writer :cancelation_token

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      # Lifecycle state of a journey.
      sig { returns(T.nilable(Courier::JourneyState::OrSymbol)) }
      attr_reader :state

      sig { params(state: Courier::JourneyState::OrSymbol).void }
      attr_writer :state

      # Request body for creating a journey.
      sig do
        params(
          name: String,
          nodes:
            T::Array[
              T.any(
                Courier::JourneyAPIInvokeTriggerNode::OrHash,
                Courier::JourneySegmentTriggerNode::OrHash,
                Courier::JourneyAudienceTriggerNode::OrHash,
                Courier::JourneyWebhookTriggerNode::OrHash,
                Courier::JourneySendNode::OrHash,
                Courier::JourneyDelayDurationNode::OrHash,
                Courier::JourneyDelayUntilNode::OrHash,
                Courier::JourneyFetchGetDeleteNode::OrHash,
                Courier::JourneyFetchPostPutNode::OrHash,
                Courier::JourneyAINode::OrHash,
                Courier::JourneyThrottleStaticNode::OrHash,
                Courier::JourneyThrottleDynamicNode::OrHash,
                Courier::JourneyNode::JourneyBatchNode::OrHash,
                Courier::JourneyNode::JourneyAddToDigestNode::OrHash,
                Courier::JourneyExitNode::OrHash,
                Courier::JourneyNode::JourneyBranchNode::OrHash
              )
            ],
          cancelation_token: String,
          enabled: T::Boolean,
          state: Courier::JourneyState::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        nodes:,
        # Cancelation token stored on the journey definition. It tags every run the
        # journey creates so that `POST /journeys/cancel` can later cancel those runs by
        # token. Accepts a templated string such as `order-{{data.order_id}}`, which is
        # resolved per run when the journey is invoked. On a replace, omitting this field
        # preserves any existing token and sending a value replaces it.
        cancelation_token: nil,
        enabled: nil,
        # Lifecycle state of a journey.
        state: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            nodes:
              T::Array[
                T.any(
                  Courier::JourneyAPIInvokeTriggerNode,
                  Courier::JourneySegmentTriggerNode,
                  Courier::JourneyAudienceTriggerNode,
                  Courier::JourneyWebhookTriggerNode,
                  Courier::JourneySendNode,
                  Courier::JourneyDelayDurationNode,
                  Courier::JourneyDelayUntilNode,
                  Courier::JourneyFetchGetDeleteNode,
                  Courier::JourneyFetchPostPutNode,
                  Courier::JourneyAINode,
                  Courier::JourneyThrottleStaticNode,
                  Courier::JourneyThrottleDynamicNode,
                  Courier::JourneyNode::JourneyBatchNode,
                  Courier::JourneyNode::JourneyAddToDigestNode,
                  Courier::JourneyExitNode,
                  Courier::JourneyNode::JourneyBranchNode
                )
              ],
            cancelation_token: String,
            enabled: T::Boolean,
            state: Courier::JourneyState::OrSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
