# frozen_string_literal: true

module Courier
  module Models
    class AutomationRunStepsResponse < Courier::Internal::Type::BaseModel
      # @!attribute steps
      #
      #   @return [Array<Courier::Models::AutomationRunStep>]
      required :steps, -> { Courier::Internal::Type::ArrayOf[Courier::AutomationRunStep] }

      # @!method initialize(steps:)
      #   Every step of an Automation run. Not paginated.
      #
      #   @param steps [Array<Courier::Models::AutomationRunStep>]
    end
  end
end
