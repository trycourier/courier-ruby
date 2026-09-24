# typed: strong

module Courier
  module Models
    module Notifications
      PreviewRunDetail = Previews::PreviewRunDetail

      module Previews
        class PreviewRunDetail < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Notifications::Previews::PreviewRunDetail,
                Courier::Internal::AnyHash
              )
            end

          # Unique identifier for the preview run.
          sig { returns(String) }
          attr_accessor :id

          # ISO-8601 timestamp of when the run was created.
          sig { returns(String) }
          attr_accessor :created_at

          # The devices this run was submitted for, snapshotted when the run was created.
          sig { returns(T::Array[String]) }
          attr_accessor :device_ids

          # One entry per device in `device_ids`.
          sig do
            returns(T::Array[Courier::Notifications::Previews::PreviewResult])
          end
          attr_accessor :results

          # Where the run itself has got to. `PENDING` and `RENDERED` mean Courier is still
          # preparing the email, `SUBMITTED` means it is with the rendering service, and
          # `COMPLETED` means every device has reported. `FAILED` is the run as a whole
          # failing — an individual device failing never fails the run.
          sig do
            returns(
              Courier::Notifications::Previews::PreviewRunStatus::TaggedSymbol
            )
          end
          attr_accessor :status

          # The template that was rendered.
          sig { returns(String) }
          attr_accessor :template_id

          # Why the run failed, when `status` is `FAILED`. `NO_EMAIL_CHANNEL` and
          # `TEMPLATE_NOT_SUPPORTED` mean there was nothing to render;
          # `ALL_DEVICES_UNSUPPORTED` means every requested device has been retired and the
          # request can be fixed by choosing others.
          sig do
            returns(
              T.nilable(
                Courier::Notifications::Previews::PreviewRunFailureReason::TaggedSymbol
              )
            )
          end
          attr_reader :failure_reason

          sig do
            params(
              failure_reason:
                Courier::Notifications::Previews::PreviewRunFailureReason::OrSymbol
            ).void
          end
          attr_writer :failure_reason

          # The version of the template that was rendered — `draft`, or a zero-padded
          # published version such as `v002`. Absent until the render settles.
          sig { returns(T.nilable(String)) }
          attr_reader :template_version

          sig { params(template_version: String).void }
          attr_writer :template_version

          # A preview run together with its per-device results.
          sig do
            params(
              id: String,
              created_at: String,
              device_ids: T::Array[String],
              results:
                T::Array[
                  Courier::Notifications::Previews::PreviewResult::OrHash
                ],
              status:
                Courier::Notifications::Previews::PreviewRunStatus::OrSymbol,
              template_id: String,
              failure_reason:
                Courier::Notifications::Previews::PreviewRunFailureReason::OrSymbol,
              template_version: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for the preview run.
            id:,
            # ISO-8601 timestamp of when the run was created.
            created_at:,
            # The devices this run was submitted for, snapshotted when the run was created.
            device_ids:,
            # One entry per device in `device_ids`.
            results:,
            # Where the run itself has got to. `PENDING` and `RENDERED` mean Courier is still
            # preparing the email, `SUBMITTED` means it is with the rendering service, and
            # `COMPLETED` means every device has reported. `FAILED` is the run as a whole
            # failing — an individual device failing never fails the run.
            status:,
            # The template that was rendered.
            template_id:,
            # Why the run failed, when `status` is `FAILED`. `NO_EMAIL_CHANNEL` and
            # `TEMPLATE_NOT_SUPPORTED` mean there was nothing to render;
            # `ALL_DEVICES_UNSUPPORTED` means every requested device has been retired and the
            # request can be fixed by choosing others.
            failure_reason: nil,
            # The version of the template that was rendered — `draft`, or a zero-padded
            # published version such as `v002`. Absent until the render settles.
            template_version: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: String,
                device_ids: T::Array[String],
                results:
                  T::Array[Courier::Notifications::Previews::PreviewResult],
                status:
                  Courier::Notifications::Previews::PreviewRunStatus::TaggedSymbol,
                template_id: String,
                failure_reason:
                  Courier::Notifications::Previews::PreviewRunFailureReason::TaggedSymbol,
                template_version: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
