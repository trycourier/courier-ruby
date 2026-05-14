# frozen_string_literal: true

module Courier
  module Models
    class JourneyConditionNestedGroup < Courier::Internal::Type::BaseModel
      # @!attribute and_
      #
      #   @return [Array<Courier::Models::JourneyConditionGroup>, nil]
      optional :and_, -> { Courier::Internal::Type::ArrayOf[Courier::JourneyConditionGroup] }, api_name: :AND

      # @!attribute or_
      #
      #   @return [Array<Courier::Models::JourneyConditionGroup>, nil]
      optional :or_, -> { Courier::Internal::Type::ArrayOf[Courier::JourneyConditionGroup] }, api_name: :OR

      # @!method initialize(and_: nil, or_: nil)
      #   A nested condition group. Exactly one of `AND` or `OR` must be present at
      #   runtime; each is a list of `JourneyConditionGroup` items.
      #
      #   @param and_ [Array<Courier::Models::JourneyConditionGroup>]
      #   @param or_ [Array<Courier::Models::JourneyConditionGroup>]
    end
  end
end
