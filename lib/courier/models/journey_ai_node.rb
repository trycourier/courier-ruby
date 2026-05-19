# frozen_string_literal: true

module Courier
  module Models
    class JourneyAINode < Courier::Internal::Type::BaseModel
      # @!attribute output_schema
      #   A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
      #
      #   @return [Hash{Symbol=>Object}]
      required :output_schema, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyAINode::Type]
      required :type, enum: -> { Courier::JourneyAINode::Type }

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

      # @!attribute model
      #
      #   @return [String, nil]
      optional :model, String

      # @!attribute user_prompt
      #
      #   @return [String, nil]
      optional :user_prompt, String

      # @!attribute web_search
      #
      #   @return [Boolean, nil]
      optional :web_search, Courier::Internal::Type::Boolean

      # @!method initialize(output_schema:, type:, id: nil, conditions: nil, model: nil, user_prompt: nil, web_search: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyAINode} for more details.
      #
      #   Invoke an AI step with `user_prompt` and optional `web_search`. Returns a
      #   structured response conforming to `output_schema`.
      #
      #   @param output_schema [Hash{Symbol=>Object}] A JSONSchema object (Draft-07-compatible). Validated at runtime by Ajv.
      #
      #   @param type [Symbol, Courier::Models::JourneyAINode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr
      #
      #   @param model [String]
      #
      #   @param user_prompt [String]
      #
      #   @param web_search [Boolean]

      # @see Courier::Models::JourneyAINode#type
      module Type
        extend Courier::Internal::Type::Enum

        AI = :ai

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
