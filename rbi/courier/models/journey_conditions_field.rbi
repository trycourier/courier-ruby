# typed: strong

module Courier
  module Models
    # Condition spec for a journey node. Accepts a single condition atom, an AND/OR
    # group, or an AND/OR nested group. Omit the `conditions` property entirely to
    # express "no conditions".
    module JourneyConditionsField
      extend Courier::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            T::Array[String],
            Courier::JourneyConditionGroup,
            Courier::JourneyConditionNestedGroup
          )
        end

      sig do
        override.returns(T::Array[Courier::JourneyConditionsField::Variants])
      end
      def self.variants
      end
    end
  end
end
