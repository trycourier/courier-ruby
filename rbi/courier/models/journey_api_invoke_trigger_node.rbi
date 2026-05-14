# typed: strong

module Courier
  module Models
    class JourneyAPIInvokeTriggerNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Courier::JourneyAPIInvokeTriggerNode,
            Courier::Internal::AnyHash
          )
        end

      sig do
        returns(Courier::JourneyAPIInvokeTriggerNode::TriggerType::OrSymbol)
      end
      attr_accessor :trigger_type

      sig { returns(Courier::JourneyAPIInvokeTriggerNode::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

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

      # A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :schema

      sig { params(schema: T::Hash[Symbol, T.anything]).void }
      attr_writer :schema

      sig do
        params(
          trigger_type:
            Courier::JourneyAPIInvokeTriggerNode::TriggerType::OrSymbol,
          type: Courier::JourneyAPIInvokeTriggerNode::Type::OrSymbol,
          id: String,
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            ),
          schema: T::Hash[Symbol, T.anything]
        ).returns(T.attached_class)
      end
      def self.new(
        trigger_type:,
        type:,
        id: nil,
        # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        # group, or an AND/OR nested group. Omit the `conditions` property entirely to
        # express "no conditions".
        conditions: nil,
        # A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
        schema: nil
      )
      end

      sig do
        override.returns(
          {
            trigger_type:
              Courier::JourneyAPIInvokeTriggerNode::TriggerType::OrSymbol,
            type: Courier::JourneyAPIInvokeTriggerNode::Type::OrSymbol,
            id: String,
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              ),
            schema: T::Hash[Symbol, T.anything]
          }
        )
      end
      def to_hash
      end

      module TriggerType
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneyAPIInvokeTriggerNode::TriggerType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        API_INVOKE =
          T.let(
            :"api-invoke",
            Courier::JourneyAPIInvokeTriggerNode::TriggerType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::JourneyAPIInvokeTriggerNode::TriggerType::TaggedSymbol
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
            T.all(Symbol, Courier::JourneyAPIInvokeTriggerNode::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRIGGER =
          T.let(
            :trigger,
            Courier::JourneyAPIInvokeTriggerNode::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::JourneyAPIInvokeTriggerNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
