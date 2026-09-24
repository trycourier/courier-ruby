# typed: strong

module Courier
  module Models
    module Notifications
      PreviewResultStatus = Previews::PreviewResultStatus

      module Previews
        # One device's outcome. `COMPLETED` means the screenshot exists and its URLs are
        # populated. `UNSUPPORTED`, `TIMED_OUT` and `FAILED` are all terminal, and none
        # stands in for another — `UNSUPPORTED` means the device was retired at the
        # vendor, `TIMED_OUT` means it did not report in time.
        module PreviewResultStatus
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Courier::Notifications::Previews::PreviewResultStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :PENDING,
              Courier::Notifications::Previews::PreviewResultStatus::TaggedSymbol
            )
          PROCESSING =
            T.let(
              :PROCESSING,
              Courier::Notifications::Previews::PreviewResultStatus::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :COMPLETED,
              Courier::Notifications::Previews::PreviewResultStatus::TaggedSymbol
            )
          UNSUPPORTED =
            T.let(
              :UNSUPPORTED,
              Courier::Notifications::Previews::PreviewResultStatus::TaggedSymbol
            )
          TIMED_OUT =
            T.let(
              :TIMED_OUT,
              Courier::Notifications::Previews::PreviewResultStatus::TaggedSymbol
            )
          FAILED =
            T.let(
              :FAILED,
              Courier::Notifications::Previews::PreviewResultStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Notifications::Previews::PreviewResultStatus::TaggedSymbol
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
