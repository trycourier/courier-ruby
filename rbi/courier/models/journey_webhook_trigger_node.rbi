# typed: strong

module Courier
  module Models
    class JourneyWebhookTriggerNode < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Courier::JourneyWebhookTriggerNode, Courier::Internal::AnyHash)
        end

      # The provider key the webhook URL is minted for. Required, and must not contain a
      # forward slash.
      sig { returns(String) }
      attr_accessor :event_source

      sig { returns(Courier::JourneyWebhookTriggerNode::TriggerType::OrSymbol) }
      attr_accessor :trigger_type

      sig { returns(Courier::JourneyWebhookTriggerNode::Type::OrSymbol) }
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

      # An optional event filter, matched against the payload's `event` field. A sender
      # that supplies no `event` matches the literal `custom`. Must not contain a
      # forward slash. Omit to accept every event delivered to the URL.
      sig { returns(T.nilable(String)) }
      attr_reader :event_id

      sig { params(event_id: String).void }
      attr_writer :event_id

      # Trigger fired when an external system POSTs to the webhook URL minted for
      # `event_source`. Narrow it to one event with `event_id`, or omit `event_id` to
      # accept every event delivered to the URL.
      sig do
        params(
          event_source: String,
          trigger_type:
            Courier::JourneyWebhookTriggerNode::TriggerType::OrSymbol,
          type: Courier::JourneyWebhookTriggerNode::Type::OrSymbol,
          id: String,
          conditions:
            T.any(
              T::Array[String],
              Courier::JourneyConditionGroup::OrHash,
              Courier::JourneyConditionNestedGroup::OrHash
            ),
          event_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The provider key the webhook URL is minted for. Required, and must not contain a
        # forward slash.
        event_source:,
        trigger_type:,
        type:,
        id: nil,
        # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
        # group, or an AND/OR nested group. Omit the `conditions` property entirely to
        # express "no conditions".
        conditions: nil,
        # An optional event filter, matched against the payload's `event` field. A sender
        # that supplies no `event` matches the literal `custom`. Must not contain a
        # forward slash. Omit to accept every event delivered to the URL.
        event_id: nil
      )
      end

      sig do
        override.returns(
          {
            event_source: String,
            trigger_type:
              Courier::JourneyWebhookTriggerNode::TriggerType::OrSymbol,
            type: Courier::JourneyWebhookTriggerNode::Type::OrSymbol,
            id: String,
            conditions:
              T.any(
                T::Array[String],
                Courier::JourneyConditionGroup,
                Courier::JourneyConditionNestedGroup
              ),
            event_id: String
          }
        )
      end
      def to_hash
      end

      module TriggerType
        extend Courier::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Courier::JourneyWebhookTriggerNode::TriggerType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WEBHOOK =
          T.let(
            :webhook,
            Courier::JourneyWebhookTriggerNode::TriggerType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Courier::JourneyWebhookTriggerNode::TriggerType::TaggedSymbol
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
            T.all(Symbol, Courier::JourneyWebhookTriggerNode::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRIGGER =
          T.let(
            :trigger,
            Courier::JourneyWebhookTriggerNode::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Courier::JourneyWebhookTriggerNode::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
