# frozen_string_literal: true

module Trycourier
  module Models
    class PagerdutyRecipient < Trycourier::Internal::Type::BaseModel
      # @!attribute pagerduty
      #
      #   @return [Trycourier::Models::Pagerduty]
      required :pagerduty, -> { Trycourier::Pagerduty }

      # @!method initialize(pagerduty:)
      #   Send via PagerDuty
      #
      #   @param pagerduty [Trycourier::Models::Pagerduty]
    end
  end
end
