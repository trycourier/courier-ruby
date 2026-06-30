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

      # Send to the recipient. A send node sources its content from EXACTLY ONE of `message.template` (a single notification template) or `experiment` (an A/B split across weighted template variants) — supplying both, or neither, is rejected. Optionally override the recipient address, delay the send, or attach `data`.
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

      # Collect events arriving at the node into a single batch and fire one downstream step with the aggregated payload. The first event into a batch owns the run; later contributing events terminate at the batch step. The batch releases when any of `max_items` is reached, a quiet window of `wait_period` elapses, or the `max_wait_period` ceiling hits.
      variant -> { Courier::JourneyNode::JourneyBatchNode }

      # Add the current event to a digest keyed by the given subscription topic. The digest accumulates events and releases them on the schedule configured for the topic.
      variant -> { Courier::JourneyNode::JourneyAddToDigestNode }

      # Terminate the journey run.
      variant -> { Courier::JourneyExitNode }

      # Branch node. Routes to the first entry in `paths[]` whose `conditions` match, else falls through to `default.nodes`.
      variant -> { Courier::JourneyNode::JourneyBranchNode }

      class JourneyBatchNode < Courier::Internal::Type::BaseModel
        # @!attribute max_wait_period
        #   ISO 8601 duration. Hard ceiling from the first event into the batch; releases
        #   the batch unconditionally when it elapses.
        #
        #   @return [String]
        required :max_wait_period, String

        # @!attribute retain
        #   How to select which collected events to retain in the aggregated payload when
        #   the batch releases.
        #
        #   @return [Courier::Models::JourneyNode::JourneyBatchNode::Retain]
        required :retain, -> { Courier::JourneyNode::JourneyBatchNode::Retain }

        # @!attribute scope
        #
        #   @return [Symbol, Courier::Models::JourneyNode::JourneyBatchNode::Scope]
        required :scope, enum: -> { Courier::JourneyNode::JourneyBatchNode::Scope }

        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::JourneyNode::JourneyBatchNode::Type]
        required :type, enum: -> { Courier::JourneyNode::JourneyBatchNode::Type }

        # @!attribute wait_period
        #   ISO 8601 duration. Quiet window that releases the batch when it elapses with no
        #   new contributing events. Must be less than `max_wait_period`.
        #
        #   @return [String]
        required :wait_period, String

        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute category_key
        #   Optional partition key. Events with the same `category_key` are batched
        #   together; events with different values are batched separately.
        #
        #   @return [String, nil]
        optional :category_key, String

        # @!attribute conditions
        #   Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        #   group, or an AND/OR nested group. Omit the `conditions` property entirely to
        #   express "no conditions".
        #
        #   @return [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup, nil]
        optional :conditions, union: -> { Courier::JourneyConditionsField }

        # @!attribute max_items
        #   Releases the batch once this many events have been collected.
        #
        #   @return [Integer, nil]
        optional :max_items, Integer

        # @!method initialize(max_wait_period:, retain:, scope:, type:, wait_period:, id: nil, category_key: nil, conditions: nil, max_items: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::JourneyNode::JourneyBatchNode} for more details.
        #
        #   Collect events arriving at the node into a single batch and fire one downstream
        #   step with the aggregated payload. The first event into a batch owns the run;
        #   later contributing events terminate at the batch step. The batch releases when
        #   any of `max_items` is reached, a quiet window of `wait_period` elapses, or the
        #   `max_wait_period` ceiling hits.
        #
        #   @param max_wait_period [String] ISO 8601 duration. Hard ceiling from the first event into the batch; releases th
        #
        #   @param retain [Courier::Models::JourneyNode::JourneyBatchNode::Retain] How to select which collected events to retain in the aggregated payload when th
        #
        #   @param scope [Symbol, Courier::Models::JourneyNode::JourneyBatchNode::Scope]
        #
        #   @param type [Symbol, Courier::Models::JourneyNode::JourneyBatchNode::Type]
        #
        #   @param wait_period [String] ISO 8601 duration. Quiet window that releases the batch when it elapses with no
        #
        #   @param id [String]
        #
        #   @param category_key [String] Optional partition key. Events with the same `category_key` are batched together
        #
        #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr
        #
        #   @param max_items [Integer] Releases the batch once this many events have been collected.

        # @see Courier::Models::JourneyNode::JourneyBatchNode#retain
        class Retain < Courier::Internal::Type::BaseModel
          # @!attribute count
          #
          #   @return [Integer]
          required :count, Integer

          # @!attribute type
          #
          #   @return [Symbol, Courier::Models::JourneyNode::JourneyBatchNode::Retain::Type]
          required :type, enum: -> { Courier::JourneyNode::JourneyBatchNode::Retain::Type }

          # @!attribute sort_key
          #   Dot-path into the event payload (e.g. `data.priority`). Required when `type` is
          #   `highest` or `lowest`.
          #
          #   @return [String, nil]
          optional :sort_key, String

          # @!method initialize(count:, type:, sort_key: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::JourneyNode::JourneyBatchNode::Retain} for more details.
          #
          #   How to select which collected events to retain in the aggregated payload when
          #   the batch releases.
          #
          #   @param count [Integer]
          #
          #   @param type [Symbol, Courier::Models::JourneyNode::JourneyBatchNode::Retain::Type]
          #
          #   @param sort_key [String] Dot-path into the event payload (e.g. `data.priority`). Required when `type` is

          # @see Courier::Models::JourneyNode::JourneyBatchNode::Retain#type
          module Type
            extend Courier::Internal::Type::Enum

            FIRST = :first
            LAST = :last
            HIGHEST = :highest
            LOWEST = :lowest

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Courier::Models::JourneyNode::JourneyBatchNode#scope
        module Scope
          extend Courier::Internal::Type::Enum

          USER = :user

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Courier::Models::JourneyNode::JourneyBatchNode#type
        module Type
          extend Courier::Internal::Type::Enum

          BATCH = :batch

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class JourneyAddToDigestNode < Courier::Internal::Type::BaseModel
        # @!attribute subscription_topic_id
        #   The subscription topic that owns the digest the event is added to.
        #
        #   @return [String]
        required :subscription_topic_id, String

        # @!attribute type
        #
        #   @return [Symbol, Courier::Models::JourneyNode::JourneyAddToDigestNode::Type]
        required :type, enum: -> { Courier::JourneyNode::JourneyAddToDigestNode::Type }

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

        # @!method initialize(subscription_topic_id:, type:, id: nil, conditions: nil)
        #   Some parameter documentations has been truncated, see
        #   {Courier::Models::JourneyNode::JourneyAddToDigestNode} for more details.
        #
        #   Add the current event to a digest keyed by the given subscription topic. The
        #   digest accumulates events and releases them on the schedule configured for the
        #   topic.
        #
        #   @param subscription_topic_id [String] The subscription topic that owns the digest the event is added to.
        #
        #   @param type [Symbol, Courier::Models::JourneyNode::JourneyAddToDigestNode::Type]
        #
        #   @param id [String]
        #
        #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr

        # @see Courier::Models::JourneyNode::JourneyAddToDigestNode#type
        module Type
          extend Courier::Internal::Type::Enum

          ADD_TO_DIGEST = :"add-to-digest"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

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
      #   @return [Array(Courier::Models::JourneyAPIInvokeTriggerNode, Courier::Models::JourneySegmentTriggerNode, Courier::Models::JourneySendNode, Courier::Models::JourneyDelayDurationNode, Courier::Models::JourneyDelayUntilNode, Courier::Models::JourneyFetchGetDeleteNode, Courier::Models::JourneyFetchPostPutNode, Courier::Models::JourneyAINode, Courier::Models::JourneyThrottleStaticNode, Courier::Models::JourneyThrottleDynamicNode, Courier::Models::JourneyNode::JourneyBatchNode, Courier::Models::JourneyNode::JourneyAddToDigestNode, Courier::Models::JourneyExitNode, Courier::Models::JourneyNode::JourneyBranchNode)]
    end
  end
end
