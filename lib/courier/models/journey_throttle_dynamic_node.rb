# frozen_string_literal: true

module Courier
  module Models
    class JourneyThrottleDynamicNode < Courier::Internal::Type::BaseModel
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
      #   @return [Symbol, Courier::Models::JourneyThrottleDynamicNode::Scope]
      required :scope, enum: -> { Courier::JourneyThrottleDynamicNode::Scope }

      # @!attribute throttle_key
      #
      #   @return [String]
      required :throttle_key, String

      # @!attribute type
      #
      #   @return [Symbol, Courier::Models::JourneyThrottleDynamicNode::Type]
      required :type, enum: -> { Courier::JourneyThrottleDynamicNode::Type }

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

      # @!method initialize(max_allowed:, period:, scope:, throttle_key:, type:, id: nil, conditions: nil)
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::JourneyThrottleDynamicNode} for more details.
      #
      #   Throttle the journey by a dynamic `throttle_key`, allowing at most `max_allowed`
      #   invocations per `period`.
      #
      #   @param max_allowed [Integer]
      #
      #   @param period [String]
      #
      #   @param scope [Symbol, Courier::Models::JourneyThrottleDynamicNode::Scope]
      #
      #   @param throttle_key [String]
      #
      #   @param type [Symbol, Courier::Models::JourneyThrottleDynamicNode::Type]
      #
      #   @param id [String]
      #
      #   @param conditions [Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup] Condition spec for a journey node. Accepts a single condition atom, an AND/OR gr

      # @see Courier::Models::JourneyThrottleDynamicNode#scope
      module Scope
        extend Courier::Internal::Type::Enum

        DYNAMIC = :dynamic

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Courier::Models::JourneyThrottleDynamicNode#type
      module Type
        extend Courier::Internal::Type::Enum

        THROTTLE = :throttle

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
