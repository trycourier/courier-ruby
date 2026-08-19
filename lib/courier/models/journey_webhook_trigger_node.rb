# frozen_string_literal: true

module Courier
  module Models
    class JourneyWebhookTriggerNode < Courier::Internal::Type::BaseModel
      # @!attribute event_source
      #   The provider key the webhook URL is minted for. Required, and must not contain a
      #   forward slash.
      #
      #   @return [String]
      required :event_source, String

      # @!attribute trigger_type
      #
      #   @return [Symbol, Courier::Models::JourneyWebhookTriggerNode::TriggerType]
      required :trigger_type, enum: -> { Courier::JourneyWebhookTriggerNode::TriggerType }

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyWebhookTriggerNode::Type]
      required :type, enum: -> { Courier::JourneyWebhookTriggerNode::Type }

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

      # @!attribute event_id
      #   An optional event filter, matched against the payload's `event` field. A sender
      #   that supplies no `event` matches the literal `custom`. Must not contain a
      #   forward slash. Omit to accept every event delivered to the URL.
      #
      #   @return [String, nil]
      optional :event_id, String

      # @!method initialize(event_source:, trigger_type:, type:, id: nil, conditions: nil, event_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyWebhookTriggerNode} for more details.
      #
      #   Trigger fired when an external system POSTs to the webhook URL minted for
      #   `event_source`. Narrow it to one event with `event_id`, or omit `event_id` to
      #   accept every event delivered to the URL.
      #
      #   @param event_source [String] The provider key the webhook URL is minted for. Required, and must not contain a
      #
      #   @param trigger_type [Symbol, Courier::Models::JourneyWebhookTriggerNode::TriggerType]
      #
      #   @param type [Symbol, Courier::Models::JourneyWebhookTriggerNode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr
      #
      #   @param event_id [String] An optional event filter, matched against the payload's `event` field. A sender

      # @see Courier::Models::JourneyWebhookTriggerNode#trigger_type
      module TriggerType
        extend Courier::Internal::Type::Enum

        WEBHOOK = :webhook

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyWebhookTriggerNode#type
      module Type
        extend Courier::Internal::Type::Enum

        TRIGGER = :trigger

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
