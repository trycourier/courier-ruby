# frozen_string_literal: true

module Courier
  module Models
    # A day of the week. Accepted case-insensitively, returned lowercase.
    module DigestDayOfWeek
      extend Courier::Internal::Type::Enum

      SUNDAY = :sunday
      MONDAY = :monday
      TUESDAY = :tuesday
      WEDNESDAY = :wednesday
      THURSDAY = :thursday
      FRIDAY = :friday
      SATURDAY = :saturday

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
