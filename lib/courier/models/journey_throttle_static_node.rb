# frozen_string_literal: true

module Courier
  module Models
    class JourneyThrottleStaticNode < Courier::Internal::Type::BaseModel
      # @!attribute max_allowed
      #
      #   @return [Integer]
      required :max_allowed, Integer

      # @!attribute period
      #
      #   @return [String]
      required :period, String

      # @!attribute scope
      #
      #   @return [Symbol, Courier::Models::JourneyThrottleStaticNode::Scope]
      required :scope, enum: -> { Courier::JourneyThrottleStaticNode::Scope }

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyThrottleStaticNode::Type]
      required :type, enum: -> { Courier::JourneyThrottleStaticNode::Type }

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

      # @!method initialize(max_allowed:, period:, scope:, type:, id: nil, conditions: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyThrottleStaticNode} for more details.
      #
      #   Throttle the journey by a static `scope` (`user` or `global`), allowing at most
      #   `max_allowed` invocations per `period`.
      #
      #   @param max_allowed [Integer]
      #
      #   @param period [String]
      #
      #   @param scope [Symbol, Courier::Models::JourneyThrottleStaticNode::Scope]
      #
      #   @param type [Symbol, Courier::Models::JourneyThrottleStaticNode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr

      # @see Courier::Models::JourneyThrottleStaticNode#scope
      module Scope
        extend Courier::Internal::Type::Enum

        USER = :user
        GLOBAL = :global

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyThrottleStaticNode#type
      module Type
        extend Courier::Internal::Type::Enum

        THROTTLE = :throttle

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
