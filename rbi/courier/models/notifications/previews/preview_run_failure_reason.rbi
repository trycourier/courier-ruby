# typed: strong

module Courier
  module Models
    module Notifications
      PreviewRunFailureReason = Previews::PreviewRunFailureReason

      module Previews
        # Why the run failed, when `status` is `FAILED`. `NO_EMAIL_CHANNEL` and
        # `TEMPLATE_NOT_SUPPORTED` mean there was nothing to render;
        # `ALL_DEVICES_UNSUPPORTED` means every requested device has been retired and the
        # request can be fixed by choosing others.
        module PreviewRunFailureReason
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::Notifications::Previews::PreviewRunFailureReason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEMPLATE_NOT_SUPPORTED =
            T.let(
              :TEMPLATE_NOT_SUPPORTED,
              Courier::Notifications::Previews::PreviewRunFailureReason::TaggedSymbol
            )
          NO_EMAIL_CHANNEL =
            T.let(
              :NO_EMAIL_CHANNEL,
              Courier::Notifications::Previews::PreviewRunFailureReason::TaggedSymbol
            )
          RENDER_FAILED =
            T.let(
              :RENDER_FAILED,
              Courier::Notifications::Previews::PreviewRunFailureReason::TaggedSymbol
            )
          ALL_DEVICES_UNSUPPORTED =
            T.let(
              :ALL_DEVICES_UNSUPPORTED,
              Courier::Notifications::Previews::PreviewRunFailureReason::TaggedSymbol
            )
          VENDOR_ERROR =
            T.let(
              :VENDOR_ERROR,
              Courier::Notifications::Previews::PreviewRunFailureReason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Notifications::Previews::PreviewRunFailureReason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
