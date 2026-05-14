# frozen_string_literal: true

module Courier
  module Models
    class JourneyDelayUntilNode < Courier::Internal::Type::BaseModel
      # @!attribute mode
      #
      #   @return [Symbol, Courier::Models::JourneyDelayUntilNode::Mode]
      required :mode, enum: -> { Courier::JourneyDelayUntilNode::Mode }

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyDelayUntilNode::Type]
      required :type, enum: -> { Courier::JourneyDelayUntilNode::Type }

      # @!attribute until_
      #
      #   @return [String]
      required :until_, String, api_name: :until

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

      # @!method initialize(mode:, type:, until_:, id: nil, conditions: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyDelayUntilNode} for more details.
      #
      #   @param mode [Symbol, Courier::Models::JourneyDelayUntilNode::Mode]
      #
      #   @param type [Symbol, Courier::Models::JourneyDelayUntilNode::Type]
      #
      #   @param until_ [String]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr

      # @see Courier::Models::JourneyDelayUntilNode#mode
      module Mode
        extend Courier::Internal::Type::Enum

        UNTIL = :until

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyDelayUntilNode#type
      module Type
        extend Courier::Internal::Type::Enum

        DELAY = :delay

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
