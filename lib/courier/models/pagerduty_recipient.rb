# frozen_string_literal: true

module Courier
  module Models
    class PagerdutyRecipient < Courier::Internal::Type::BaseModel
      # @!attribute pagerduty
      #
      #   @return [Courier::Models::Pagerduty]
      required :pagerduty, -> { Courier::Pagerduty }

      # @!method initialize(pagerduty:)
      #   Send via PagerDuty
      #
      #   @param pagerduty [Courier::Models::Pagerduty]
    end
  end
end
