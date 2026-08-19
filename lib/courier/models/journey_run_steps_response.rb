# frozen_string_literal: true

module Courier
  module Models
    class JourneyRunStepsResponse < Courier::Internal::Type::BaseModel
      # @!attribute steps
      #
      #   @return [Array<Courier::Models::JourneyRunStep>]
      required :steps, -> { Courier::Internal::Type::ArrayOf[Courier::JourneyRunStep] }

      # @!method initialize(steps:)
      #   Every step of a Journey run. Not paginated.
      #
      #   @param steps [Array<Courier::Models::JourneyRunStep>]
    end
  end
end
