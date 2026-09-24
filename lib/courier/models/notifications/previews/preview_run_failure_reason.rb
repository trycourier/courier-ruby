# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      module Previews
        # Why the run failed, when `status` is `FAILED`. `NO_EMAIL_CHANNEL` and
        # `TEMPLATE_NOT_SUPPORTED` mean there was nothing to render;
        # `ALL_DEVICES_UNSUPPORTED` means every requested device has been retired and the
        # request can be fixed by choosing others.
        module PreviewRunFailureReason
          extend Courier::Internal::Type::Enum

          TEMPLATE_NOT_SUPPORTED = :TEMPLATE_NOT_SUPPORTED
          NO_EMAIL_CHANNEL = :NO_EMAIL_CHANNEL
          RENDER_FAILED = :RENDER_FAILED
          ALL_DEVICES_UNSUPPORTED = :ALL_DEVICES_UNSUPPORTED
          VENDOR_ERROR = :VENDOR_ERROR

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      PreviewRunFailureReason = Previews::PreviewRunFailureReason
    end
  end
end
