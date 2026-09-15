# frozen_string_literal: true

module Courier
  module Models
    # How often a digest is delivered. `instant` delivers immediately without
    # batching, and is the one value that takes no `time`.
    module DigestFrequency
      extend Courier::Internal::Type::Enum

      INSTANT = :instant
      DAILY = :daily
      WEEKDAYS = :weekdays
      WEEKLY = :weekly
      CUSTOM_DAYS = :custom_days
      MONTHLY = :monthly

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
