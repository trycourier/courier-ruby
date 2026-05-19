# frozen_string_literal: true

module Courier
  module Models
    # A single node in a journey DAG. Discriminated by `type`, with a secondary
    # discriminator on some variants (`trigger_type` for trigger, `mode` for delay,
    # `method` for fetch, `scope` for throttle).
    module JourneyNode
      extend Courier::Internal::Type::Union

      # Trigger fired when the journey is invoked via the API. The optional `schema` field is a JSON Schema that validates the invocation payload.
      variant -> { Courier::JourneyAPIInvokeTriggerNode }

      # Trigger fired by a segment event (`identify`, `group`, or `track`).
      variant -> { Courier::JourneySegmentTriggerNode }

      # Send a notification template to the recipient. Optionally override the recipient address, delay the send, or attach `data`.
      variant -> { Courier::JourneySendNode }

      # Pause the journey run for a fixed `duration`.
      variant -> { Courier::JourneyDelayDurationNode }

      # Pause the journey run `until` a specific time.
      variant -> { Courier::JourneyDelayUntilNode }

      # Issue an HTTP GET or DELETE request and merge the response into the journey state per `merge_strategy`.
      variant -> { Courier::JourneyFetchGetDeleteNode }

      # Issue an HTTP POST or PUT request with a `body` and merge the response into the journey state per `merge_strategy`.
      variant -> { Courier::JourneyFetchPostPutNode }

      # Invoke an AI step with `user_prompt` and optional `web_search`. Returns a structured response conforming to `output_schema`.
      variant -> { Courier::JourneyAINode }

      # Throttle the journey by a static `scope` (`user` or `global`), allowing at most `max_allowed` invocations per `period`.
      variant -> { Courier::JourneyThrottleStaticNode }

      # Throttle the journey by a dynamic `throttle_key`, allowing at most `max_allowed` invocations per `period`.
      variant -> { Courier::JourneyThrottleDynamicNode }

      # Terminate the journey run.
      variant -> { Courier::JourneyExitNode }

      # Branch node. Routes to the first entry in `paths[]` whose `conditions` match, else falls through to `default.nodes`.
      variant -> { Courier::JourneyNode::JourneyBranchNode }

      class JourneyBranchNode < Courier::Internal::Type::BaseModel
        # @!attribute default
        #
        #   @return [Courier::Models::JourneyNode::JourneyBranchNode::Default]
        required :default, -> { Courier::JourneyNode::JourneyBranchNode::Default }

        # @!attribute paths
        #
        #   @return [Array<Courier::Models::JourneyNode::JourneyBranchNode::Path>]
        required :paths, -> { Courier::Internal::Type::ArrayOf[Courier::JourneyNode::JourneyBranchNode::Path] }

        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::JourneyNode::JourneyBranchNode::Type]
        required :type, enum: -> { Courier::JourneyNode::JourneyBranchNode::Type }

        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!method initialize(default:, paths:, type:, id: nil)
        #   Branch node. Routes to the first entry in `paths[]` whose `conditions` match,
        #   else falls through to `default.nodes`.
        #
        #   @param default [Courier::Models::JourneyNode::JourneyBranchNode::Default]
        #   @param paths [Array<Courier::Models::JourneyNode::JourneyBranchNode::Path>]
        #   @param type [Symbol, Courier::Models::JourneyNode::JourneyBranchNode::Type]
        #   @param id [String]

        # @see Courier::Models::JourneyNode::JourneyBranchNode#default
        class Default < Courier::Internal::Type::BaseModel
          # @!attribute nodes
          #
          #   @return [Array<Courier::Models::JourneyNode>]
          required :nodes, -> { Courier::Internal::Type::ArrayOf[union: Courier::JourneyNode] }

          # @!attribute label
          #
          #   @return [String, nil]
          optional :label, String

          # @!method initialize(nodes:, label: nil)
          #   @param nodes [Array<Courier::Models::JourneyNode>]
          #   @param label [String]
        end

        class Path < Courier::Internal::Type::BaseModel
          # @!attribute conditions
          #   Condition spec for a journey node. Accepts a single condition atom, an AND/OR
          #   group, or an AND/OR nested group. Omit the `conditions` property entirely to
          #   express "no conditions".
          #
          #   @return [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup]
          required :conditions, union: -> { Courier::JourneyConditionsField }

          # @!attribute nodes
          #
          #   @return [Array<Courier::Models::JourneyNode>]
          required :nodes, -> { Courier::Internal::Type::ArrayOf[union: Courier::JourneyNode] }

          # @!attribute label
          #
          #   @return [String, nil]
          optional :label, String

          # @!method initialize(conditions:, nodes:, label: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::JourneyNode::JourneyBranchNode::Path} for more details.
          #
          #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr
          #
          #   @param nodes [Array<Courier::Models::JourneyNode>]
          #
          #   @param label [String]
        end

        # @see Courier::Models::JourneyNode::JourneyBranchNode#type
        module Type
          extend Courier::Internal::Type::Enum

          BRANCH = :branch

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode)]
    end
  end
end
