# typed: strong

module Courier
  module Models
    # A single node in a journey DAG. Discriminated by `type`, with a secondary
    # discriminator on some variants (`trigger_type` for trigger, `mode` for delay,
    # `method` for fetch, `scope` for throttle).
    module JourneyNode
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Courier::JourneyAPIInvokeTriggerNode,
            Courier::JourneySegmentTriggerNode,
            Courier::JourneySendNode,
            Courier::JourneyDelayDurationNode,
            Courier::JourneyDelayUntilNode,
            Courier::JourneyFetchGetDeleteNode,
            Courier::JourneyFetchPostPutNode,
            Courier::JourneyAINode,
            Courier::JourneyThrottleStaticNode,
            Courier::JourneyThrottleDynamicNode,
            Courier::JourneyNode::JourneyBatchNode,
            Courier::JourneyExitNode,
            Courier::JourneyNode::JourneyBranchNode
          )
        end

      class JourneyBatchNode < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::JourneyNode::JourneyBatchNode,
              Courier::Internal::AnyHash
            )
          end

        # ISO 8601 duration. Hard ceiling from the first event into the batch; releases
        # the batch unconditionally when it elapses.
        sig { returns(String) }
        attr_accessor :max_wait_period

        # How to select which collected events to retain in the aggregated payload when
        # the batch releases.
        sig { returns(Courier::JourneyNode::JourneyBatchNode::Retain) }
        attr_reader :retain

        sig do
          params(
            retain: Courier::JourneyNode::JourneyBatchNode::Retain::OrHash
          ).void
        end
        attr_writer :retain

        sig { returns(Courier::JourneyNode::JourneyBatchNode::Scope::OrSymbol) }
        attr_accessor :scope

        sig { returns(Courier::JourneyNode::JourneyBatchNode::Type::OrSymbol) }
        attr_accessor :type

        # ISO 8601 duration. Quiet window that releases the batch when it elapses with no
        # new contributing events. Must be less than `max_wait_period`.
        sig { returns(String) }
        attr_accessor :wait_period

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Optional partition key. Events with the same `category_key` are batched
        # together; events with different values are batched separately.
        sig { returns(T.nilable(String)) }
        attr_reader :category_key

        sig { params(category_key: String).void }
        attr_writer :category_key

        # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        # group, or an AND/OR nested group. Omit the `conditions` property entirely to
        # express "no conditions".
        sig do
          returns(
            T.nilable(
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              )
            )
          )
        end
        attr_reader :conditions

        sig do
          params(
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup::OrHash,
                Courier::JourneyConditionNestedGroup::OrHash
              )
          ).void
        end
        attr_writer :conditions

        # Releases the batch once this many events have been collected.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_items

        sig { params(max_items: Integer).void }
        attr_writer :max_items

        # Collect events arriving at the node into a single batch and fire one downstream
        # step with the aggregated payload. The first event into a batch owns the run;
        # later contributing events terminate at the batch step. The batch releases when
        # any of `max_items` is reached, a quiet window of `wait_period` elapses, or the
        # `max_wait_period` ceiling hits.
        sig do
          params(
            max_wait_period: String,
            retain: Courier::JourneyNode::JourneyBatchNode::Retain::OrHash,
            scope: Courier::JourneyNode::JourneyBatchNode::Scope::OrSymbol,
            type: Courier::JourneyNode::JourneyBatchNode::Type::OrSymbol,
            wait_period: String,
            id: String,
            category_key: String,
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup::OrHash,
                Courier::JourneyConditionNestedGroup::OrHash
              ),
            max_items: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # ISO 8601 duration. Hard ceiling from the first event into the batch; releases
          # the batch unconditionally when it elapses.
          max_wait_period:,
          # How to select which collected events to retain in the aggregated payload when
          # the batch releases.
          retain:,
          scope:,
          type:,
          # ISO 8601 duration. Quiet window that releases the batch when it elapses with no
          # new contributing events. Must be less than `max_wait_period`.
          wait_period:,
          id: nil,
          # Optional partition key. Events with the same `category_key` are batched
          # together; events with different values are batched separately.
          category_key: nil,
          # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
          # group, or an AND/OR nested group. Omit the `conditions` property entirely to
          # express "no conditions".
          conditions: nil,
          # Releases the batch once this many events have been collected.
          max_items: nil
        )
        end

        sig do
          override.returns(
            {
              max_wait_period: String,
              retain: Courier::JourneyNode::JourneyBatchNode::Retain,
              scope: Courier::JourneyNode::JourneyBatchNode::Scope::OrSymbol,
              type: Courier::JourneyNode::JourneyBatchNode::Type::OrSymbol,
              wait_period: String,
              id: String,
              category_key: String,
              conditions:
                T.any(
                  T::Array[String],
                  Courier::JourneyConditionGroup,
                  Courier::JourneyConditionNestedGroup
                ),
              max_items: Integer
            }
          )
        end
        def to_hash
        end

        class Retain < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::JourneyNode::JourneyBatchNode::Retain,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :count

          sig do
            returns(
              Courier::JourneyNode::JourneyBatchNode::Retain::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Dot-path into the event payload (e.g. `data.priority`). Required when `type` is
          # `highest` or `lowest`.
          sig { returns(T.nilable(String)) }
          attr_reader :sort_key

          sig { params(sort_key: String).void }
          attr_writer :sort_key

          # How to select which collected events to retain in the aggregated payload when
          # the batch releases.
          sig do
            params(
              count: Integer,
              type:
                Courier::JourneyNode::JourneyBatchNode::Retain::Type::OrSymbol,
              sort_key: String
            ).returns(T.attached_class)
          end
          def self.new(
            count:,
            type:,
            # Dot-path into the event payload (e.g. `data.priority`). Required when `type` is
            # `highest` or `lowest`.
            sort_key: nil
          )
          end

          sig do
            override.returns(
              {
                count: Integer,
                type:
                  Courier::JourneyNode::JourneyBatchNode::Retain::Type::OrSymbol,
                sort_key: String
              }
            )
          end
          def to_hash
          end

          module Type
            extend Courier::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Courier::JourneyNode::JourneyBatchNode::Retain::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FIRST =
              T.let(
                :first,
                Courier::JourneyNode::JourneyBatchNode::Retain::Type::TaggedSymbol
              )
            LAST =
              T.let(
                :last,
                Courier::JourneyNode::JourneyBatchNode::Retain::Type::TaggedSymbol
              )
            HIGHEST =
              T.let(
                :highest,
                Courier::JourneyNode::JourneyBatchNode::Retain::Type::TaggedSymbol
              )
            LOWEST =
              T.let(
                :lowest,
                Courier::JourneyNode::JourneyBatchNode::Retain::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Courier::JourneyNode::JourneyBatchNode::Retain::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        module Scope
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::JourneyNode::JourneyBatchNode::Scope)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER =
            T.let(
              :user,
              Courier::JourneyNode::JourneyBatchNode::Scope::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::JourneyNode::JourneyBatchNode::Scope::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::JourneyNode::JourneyBatchNode::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BATCH =
            T.let(
              :batch,
              Courier::JourneyNode::JourneyBatchNode::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::JourneyNode::JourneyBatchNode::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class JourneyBranchNode < Courier::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Courier::JourneyNode::JourneyBranchNode,
              Courier::Internal::AnyHash
            )
          end

        sig { returns(Courier::JourneyNode::JourneyBranchNode::Default) }
        attr_reader :default

        sig do
          params(
            default: Courier::JourneyNode::JourneyBranchNode::Default::OrHash
          ).void
        end
        attr_writer :default

        sig { returns(T::Array[Courier::JourneyNode::JourneyBranchNode::Path]) }
        attr_accessor :paths

        sig { returns(Courier::JourneyNode::JourneyBranchNode::Type::OrSymbol) }
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Branch node. Routes to the first entry in `paths[]` whose `conditions` match,
        # else falls through to `default.nodes`.
        sig do
          params(
            default: Courier::JourneyNode::JourneyBranchNode::Default::OrHash,
            paths:
              T::Array[Courier::JourneyNode::JourneyBranchNode::Path::OrHash],
            type: Courier::JourneyNode::JourneyBranchNode::Type::OrSymbol,
            id: String
          ).returns(T.attached_class)
        end
        def self.new(default:, paths:, type:, id: nil)
        end

        sig do
          override.returns(
            {
              default: Courier::JourneyNode::JourneyBranchNode::Default,
              paths: T::Array[Courier::JourneyNode::JourneyBranchNode::Path],
              type: Courier::JourneyNode::JourneyBranchNode::Type::OrSymbol,
              id: String
            }
          )
        end
        def to_hash
        end

        class Default < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::JourneyNode::JourneyBranchNode::Default,
                Courier::Internal::AnyHash
              )
            end

          sig { returns(T::Array[Courier::JourneyNode]) }
          attr_accessor :nodes

          sig { returns(T.nilable(String)) }
          attr_reader :label

          sig { params(label: String).void }
          attr_writer :label

          sig do
            params(
              nodes: T::Array[Courier::JourneyNode],
              label: String
            ).returns(T.attached_class)
          end
          def self.new(nodes:, label: nil)
          end

          sig do
            override.returns(
              { nodes: T::Array[Courier::JourneyNode], label: String }
            )
          end
          def to_hash
          end
        end

        class Path < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::JourneyNode::JourneyBranchNode::Path,
                Courier::Internal::AnyHash
              )
            end

          # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
          # group, or an AND/OR nested group. Omit the `conditions` property entirely to
          # express "no conditions".
          sig do
            returns(
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              )
            )
          end
          attr_accessor :conditions

          sig { returns(T::Array[Courier::JourneyNode]) }
          attr_accessor :nodes

          sig { returns(T.nilable(String)) }
          attr_reader :label

          sig { params(label: String).void }
          attr_writer :label

          sig do
            params(
              conditions:
                T.any(
                  T::Array[String],
                  Courier::JourneyConditionGroup::OrHash,
                  Courier::JourneyConditionNestedGroup::OrHash
                ),
              nodes: T::Array[Courier::JourneyNode],
              label: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
            # group, or an AND/OR nested group. Omit the `conditions` property entirely to
            # express "no conditions".
            conditions:,
            nodes:,
            label: nil
          )
          end

          sig do
            override.returns(
              {
                conditions:
                  T.any(
                    T::Array[String],
                    Courier::JourneyConditionGroup,
                    Courier::JourneyConditionNestedGroup
                  ),
                nodes: T::Array[Courier::JourneyNode],
                label: String
              }
            )
          end
          def to_hash
          end
        end

        module Type
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::JourneyNode::JourneyBranchNode::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BRANCH =
            T.let(
              :branch,
              Courier::JourneyNode::JourneyBranchNode::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::JourneyNode::JourneyBranchNode::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig { override.returns(T::Array[Courier::JourneyNode::Variants]) }
      def self.variants
      end
    end
  end
end
