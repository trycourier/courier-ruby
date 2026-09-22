# typed: strong

module Courier
  module Models
    class JourneyResponse < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyResponse, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # The journey cancelation token, or null when none is set. A token authored in the
      # dashboard is returned in its raw templated form, such as
      # `order-{{data.order_id}}`, so it can be read back and asserted.
      sig { returns(T.nilable(String)) }
      attr_accessor :cancelation_token

      sig { returns(T.nilable(Integer)) }
      attr_accessor :created

      sig { returns(T.nilable(String)) }
      attr_accessor :creator

      sig { returns(T::Boolean) }
      attr_accessor :enabled

      sig { returns(String) }
      attr_accessor :name

      sig { returns(T::Array[Courier::JourneyNode::Variants]) }
      attr_accessor :nodes

      sig { returns(T.nilable(Integer)) }
      attr_accessor :published

      # Lifecycle state of a journey.
      sig { returns(Courier::JourneyState::TaggedSymbol) }
      attr_accessor :state

      sig { returns(T.nilable(Integer)) }
      attr_accessor :updated

      sig { returns(T.nilable(String)) }
      attr_accessor :updater

      # A journey, with its current draft or published nodes and metadata.
      sig do
        params(
          id: String,
          cancelation_token: T.nilable(String),
          created: T.nilable(Integer),
          creator: T.nilable(String),
          enabled: T::Boolean,
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
          published: T.nilable(Integer),
          state: Courier::JourneyState::OrSymbol,
          updated: T.nilable(Integer),
          updater: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # The journey cancelation token, or null when none is set. A token authored in the
        # dashboard is returned in its raw templated form, such as
        # `order-{{data.order_id}}`, so it can be read back and asserted.
        cancelation_token:,
        created:,
        creator:,
        enabled:,
        name:,
        nodes:,
        published:,
        # Lifecycle state of a journey.
        state:,
        updated:,
        updater:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            cancelation_token: T.nilable(String),
            created: T.nilable(Integer),
            creator: T.nilable(String),
            enabled: T::Boolean,
            name: String,
            nodes: T::Array[Courier::JourneyNode::Variants],
            published: T.nilable(Integer),
            state: Courier::JourneyState::TaggedSymbol,
            updated: T.nilable(Integer),
            updater: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
