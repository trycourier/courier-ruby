# frozen_string_literal: true

module Courier
  module Models
    class JourneyConditionGroup < Courier::Internal::Type::BaseModel
      # @!attribute and_
      #
      #   @return [Array<Array<String>>, nil]
      optional :and_,
               Courier::Internal::Type::ArrayOf[Courier::Internal::Type::ArrayOf[String]],
               api_name: :AND

      # @!attribute or_
      #
      #   @return [Array<Array<String>>, nil]
      optional :or_, Courier::Internal::Type::ArrayOf[Courier::Internal::Type::ArrayOf[String]], api_name: :OR

      # @!method initialize(and_: nil, or_: nil)
      #   A leaf condition group. Exactly one of `AND` or `OR` must be present at runtime;
      #   each is a list of `JourneyConditionAtom` tuples.
      #
      #   @param and_ [Array<Array<String>>]
      #   @param or_ [Array<Array<String>>]
    end
  end
end
