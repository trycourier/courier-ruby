# typed: strong

module Courier
  module Models
    class JourneyAudienceTriggerNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyAudienceTriggerNode, Courier::Internal::AnyHash)
        end

      # The Audience to watch. Must name a single Audience; wildcards are not supported.
      sig { returns(String) }
      attr_accessor :audience_id

      sig do
        returns(Courier::JourneyAudienceTriggerNode::TriggerType::OrSymbol)
      end
      attr_accessor :trigger_type

      sig { returns(Courier::JourneyAudienceTriggerNode::Type::OrSymbol) }
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

      # Trigger fired when a user newly matches an Audience. Leaving and re-joining the
      # Audience re-enters the Journey. Membership is new-members-only: users already in
      # the Audience when the Journey is published do not enter. Unlike the v2
      # Automations audience trigger, there is no member scope, event type, or frequency
      # mode to configure, and `audience_id` must name one Audience — wildcards are not
      # supported.
      sig do
        params(
          audience_id: String,
          trigger_type:
            Courier::JourneyAudienceTriggerNode::TriggerType::OrSymbol,
          type: Courier::JourneyAudienceTriggerNode::Type::OrSymbol,
          id: String,
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # The Audience to watch. Must name a single Audience; wildcards are not supported.
        audience_id:,
        trigger_type:,
        type:,
        id: nil,
        # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        # group, or an AND/OR nested group. Omit the `conditions` property entirely to
        # express "no conditions".
        conditions: nil
      )
      end

      sig do
        override.returns(
          {
            audience_id: String,
            trigger_type:
              Courier::JourneyAudienceTriggerNode::TriggerType::OrSymbol,
            type: Courier::JourneyAudienceTriggerNode::Type::OrSymbol,
            id: String,
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              )
          }
        )
      end
      def to_hash
      end

      module TriggerType
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneyAudienceTriggerNode::TriggerType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUDIENCE =
          T.let(
            :audience,
            Courier::JourneyAudienceTriggerNode::TriggerType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::JourneyAudienceTriggerNode::TriggerType::TaggedSymbol
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
            T.all(Symbol, Courier::JourneyAudienceTriggerNode::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRIGGER =
          T.let(
            :trigger,
            Courier::JourneyAudienceTriggerNode::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::JourneyAudienceTriggerNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
