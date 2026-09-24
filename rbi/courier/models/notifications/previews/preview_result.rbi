# typed: strong

module Courier
  module Models
    module Notifications
      PreviewResult = Previews::PreviewResult

      module Previews
        class PreviewResult < Courier::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Courier::Notifications::Previews::PreviewResult,
                Courier::Internal::AnyHash
              )
            end

          # The device this result is for, by `PreviewDevice.id`.
          sig { returns(String) }
          attr_accessor :device_id

          # Short-lived signed URL for the full-sized image. Null until the screenshot
          # exists. Re-signed on every read, so fetch it rather than storing it.
          sig { returns(T.nilable(String)) }
          attr_accessor :screenshot_url

          # One device's outcome. `COMPLETED` means the screenshot exists and its URLs are
          # populated. `UNSUPPORTED`, `TIMED_OUT` and `FAILED` are all terminal, and none
          # stands in for another — `UNSUPPORTED` means the device was retired at the
          # vendor, `TIMED_OUT` means it did not report in time.
          sig do
            returns(
              Courier::Notifications::Previews::PreviewResultStatus::TaggedSymbol
            )
          end
          attr_accessor :status

          # Short-lived signed URL for the grid-sized image. Null until the screenshot
          # exists. Re-signed on every read, so fetch it rather than storing it.
          sig { returns(T.nilable(String)) }
          attr_accessor :thumbnail_url

          # Why one device's render failed, when its `status` is `FAILED` and the cause has
          # a public name. `DELIVERY_FAILED` means the rendering service could not deliver
          # the message to its own capture mailbox — infrastructure, not anything wrong with
          # the template.
          sig do
            returns(
              T.nilable(
                Courier::Notifications::Previews::PreviewResultFailureReason::TaggedSymbol
              )
            )
          end
          attr_reader :failure_reason

          sig do
            params(
              failure_reason:
                Courier::Notifications::Previews::PreviewResultFailureReason::OrSymbol
            ).void
          end
          attr_writer :failure_reason

          # One device's result within a preview run.
          sig do
            params(
              device_id: String,
              screenshot_url: T.nilable(String),
              status:
                Courier::Notifications::Previews::PreviewResultStatus::OrSymbol,
              thumbnail_url: T.nilable(String),
              failure_reason:
                Courier::Notifications::Previews::PreviewResultFailureReason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The device this result is for, by `PreviewDevice.id`.
            device_id:,
            # Short-lived signed URL for the full-sized image. Null until the screenshot
            # exists. Re-signed on every read, so fetch it rather than storing it.
            screenshot_url:,
            # One device's outcome. `COMPLETED` means the screenshot exists and its URLs are
            # populated. `UNSUPPORTED`, `TIMED_OUT` and `FAILED` are all terminal, and none
            # stands in for another — `UNSUPPORTED` means the device was retired at the
            # vendor, `TIMED_OUT` means it did not report in time.
            status:,
            # Short-lived signed URL for the grid-sized image. Null until the screenshot
            # exists. Re-signed on every read, so fetch it rather than storing it.
            thumbnail_url:,
            # Why one device's render failed, when its `status` is `FAILED` and the cause has
            # a public name. `DELIVERY_FAILED` means the rendering service could not deliver
            # the message to its own capture mailbox — infrastructure, not anything wrong with
            # the template.
            failure_reason: nil
          )
          end

          sig do
            override.returns(
              {
                device_id: String,
                screenshot_url: T.nilable(String),
                status:
                  Courier::Notifications::Previews::PreviewResultStatus::TaggedSymbol,
                thumbnail_url: T.nilable(String),
                failure_reason:
                  Courier::Notifications::Previews::PreviewResultFailureReason::TaggedSymbol
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
