# typed: strong

module Courier
  module Models
    # A single node in a journey DAG. Discriminated by `type` plus a secondary
    # discriminator on some variants (`trigger_type` for trigger, `mode` for delay,
    # `method` for fetch, `scope` for throttle). Each variant is exported as a
    # separate schema for SDK type quality.
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
            Courier::JourneyExitNode,
            Courier::JourneyNode::JourneyBranchNode
          )
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

        # Branch node. Routes to one of `paths[]` whose `conditions` match, else falls
        # through to `default.nodes`. Inlined rather than referenced so the recursive
        # `nodes: JourneyNode[]` cycle stays within a single generated module (Stainless
        # Python forward-ref resolution does not span modules well for this recursion
        # shape).
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
