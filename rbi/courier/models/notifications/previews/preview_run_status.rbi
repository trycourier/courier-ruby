# typed: strong

module Courier
  module Models
    module Notifications
      PreviewRunStatus = Previews::PreviewRunStatus

      module Previews
        # Where the run itself has got to. `PENDING` and `RENDERED` mean Courier is still
        # preparing the email, `SUBMITTED` means it is with the rendering service, and
        # `COMPLETED` means every device has reported. `FAILED` is the run as a whole
        # failing — an individual device failing never fails the run.
        module PreviewRunStatus
          extend Courier::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Courier::Notifications::Previews::PreviewRunStatus)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :PENDING,
              Courier::Notifications::Previews::PreviewRunStatus::TaggedSymbol
            )
          RENDERED =
            T.let(
              :RENDERED,
              Courier::Notifications::Previews::PreviewRunStatus::TaggedSymbol
            )
          SUBMITTED =
            T.let(
              :SUBMITTED,
              Courier::Notifications::Previews::PreviewRunStatus::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :COMPLETED,
              Courier::Notifications::Previews::PreviewRunStatus::TaggedSymbol
            )
          FAILED =
            T.let(
              :FAILED,
              Courier::Notifications::Previews::PreviewRunStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Courier::Notifications::Previews::PreviewRunStatus::TaggedSymbol
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
