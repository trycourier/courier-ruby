# frozen_string_literal: true

module Courier
  module Models
    # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
    # group, or an AND/OR nested group. Omit the `conditions` property entirely to
    # express "no conditions".
    module JourneyConditionsField
      extend Courier::Internal::Type::Union

      # A single condition expressed as a positional tuple of strings.
      # - Binary form (3 elements): `[path, operator, value]` where `operator`
      #   is one of `is equal`, `is not equal`, `contains`, `does not contain`,
      #   `starts with`, `ends with`, `greater than`, `greater than or equal`,
      #   `less than`, `less than or equal`.
      #
      #   Example: `["user.tier", "is equal", "gold"]`.
      #
      # - Unary form (2 elements): `[path, operator]` where `operator` is
      #   one of `exists`, `does not exist`.
      #
      #   Example: `["user.email", "exists"]`.
      #
      # The first element is a non-empty dot-path. The second element is the operator (must come from one of the two operator sets above). For the binary form, the third element is the comparison value (string). Runtime validation of the operator value and arity is performed by the backend; SDKs surface this as a string list.
      variant -> { Courier::JourneyConditionAtom }

      # A leaf condition group. Exactly one of `AND` or `OR` must be present at runtime; each is a list of `JourneyConditionAtom` tuples.
      variant -> { Courier::JourneyConditionGroup }

      # A nested condition group. Exactly one of `AND` or `OR` must be present at runtime; each is a list of `JourneyConditionGroup` items.
      variant -> { Courier::JourneyConditionNestedGroup }

      # @!method self.variants
      #   @return [Array(Array<String>, Courier::Models::JourneyConditionGroup, Courier::Models::JourneyConditionNestedGroup)]
    end
  end
end
