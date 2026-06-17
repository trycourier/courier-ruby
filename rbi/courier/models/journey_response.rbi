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
          created: T.nilable(Integer),
          creator: T.nilable(String),
          enabled: T::Boolean,
          name: String,
          nodes:
            T::Array[
              T.any(
                Courier::JourneyAPIInvokeTriggerNode::OrHash,
                Courier::JourneySegmentTriggerNode::OrHash,
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
