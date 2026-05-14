# frozen_string_literal: true

module Courier
  module Models
    class JourneyAPIInvokeTriggerNode < Courier::Internal::Type::BaseModel
      # @!attribute trigger_type
      #
      #   @return [Symbol, Courier::Models::JourneyAPIInvokeTriggerNode::TriggerType]
      required :trigger_type, enum: -> { Courier::JourneyAPIInvokeTriggerNode::TriggerType }

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyAPIInvokeTriggerNode::Type]
      required :type, enum: -> { Courier::JourneyAPIInvokeTriggerNode::Type }

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

      # @!attribute schema
      #   A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :schema, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!method initialize(trigger_type:, type:, id: nil, conditions: nil, schema: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyAPIInvokeTriggerNode} for more details.
      #
      #   @param trigger_type [Symbol, Courier::Models::JourneyAPIInvokeTriggerNode::TriggerType]
      #
      #   @param type [Symbol, Courier::Models::JourneyAPIInvokeTriggerNode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr
      #
      #   @param schema [Hash{Symbol=>Object}] A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.

      # @see Courier::Models::JourneyAPIInvokeTriggerNode#trigger_type
      module TriggerType
        extend Courier::Internal::Type::Enum

        API_INVOKE = :"api-invoke"

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyAPIInvokeTriggerNode#type
      module Type
        extend Courier::Internal::Type::Enum

        TRIGGER = :trigger

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
