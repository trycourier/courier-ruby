# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      module Previews
        # Where the run itself has got to. `PENDING` and `RENDERED` mean Courier is still
        # preparing the email, `SUBMITTED` means it is with the rendering service, and
        # `COMPLETED` means every device has reported. `FAILED` is the run as a whole
        # failing — an individual device failing never fails the run.
        module PreviewRunStatus
          extend Courier::Internal::Type::Enum

          PENDING = :PENDING
          RENDERED = :RENDERED
          SUBMITTED = :SUBMITTED
          COMPLETED = :COMPLETED
          FAILED = :FAILED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      PreviewRunStatus = Previews::PreviewRunStatus
    end
  end
end
