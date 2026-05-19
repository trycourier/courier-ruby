# frozen_string_literal: true

module Courier
  module Models
    class JourneyDelayDurationNode < Courier::Internal::Type::BaseModel
      # @!attribute duration
      #
      #   @return [String]
      required :duration, String

      # @!attribute mode
      #
      #   @return [Symbol, Courier::Models::JourneyDelayDurationNode::Mode]
      required :mode, enum: -> { Courier::JourneyDelayDurationNode::Mode }

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyDelayDurationNode::Type]
      required :type, enum: -> { Courier::JourneyDelayDurationNode::Type }

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

      # @!method initialize(duration:, mode:, type:, id: nil, conditions: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyDelayDurationNode} for more details.
      #
      #   Pause the journey run for a fixed `duration`.
      #
      #   @param duration [String]
      #
      #   @param mode [Symbol, Courier::Models::JourneyDelayDurationNode::Mode]
      #
      #   @param type [Symbol, Courier::Models::JourneyDelayDurationNode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr

      # @see Courier::Models::JourneyDelayDurationNode#mode
      module Mode
        extend Courier::Internal::Type::Enum

        DURATION = :duration

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyDelayDurationNode#type
      module Type
        extend Courier::Internal::Type::Enum

        DELAY = :delay

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
