# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      module Previews
        # One device's outcome. `COMPLETED` means the screenshot exists and its URLs are
        # populated. `UNSUPPORTED`, `TIMED_OUT` and `FAILED` are all terminal, and none
        # stands in for another — `UNSUPPORTED` means the device was retired at the
        # vendor, `TIMED_OUT` means it did not report in time.
        module PreviewResultStatus
          extend Courier::Internal::Type::Enum

          PENDING = :PENDING
          PROCESSING = :PROCESSING
          COMPLETED = :COMPLETED
          UNSUPPORTED = :UNSUPPORTED
          TIMED_OUT = :TIMED_OUT
          FAILED = :FAILED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      PreviewResultStatus = Previews::PreviewResultStatus
    end
  end
end
