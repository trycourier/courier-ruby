# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      module Previews
        class PreviewResult < Courier::Internal::Type::BaseModel
          # @!attribute device_id
          #   The device this result is for, by `PreviewDevice.id`.
          #
          #   @return [String]
          required :device_id, String

          # @!attribute screenshot_url
          #   Short-lived signed URL for the full-sized image. Null until the screenshot
          #   exists. Re-signed on every read, so fetch it rather than storing it.
          #
          #   @return [String, nil]
          required :screenshot_url, String, nil?: true

          # @!attribute status
          #   One device's outcome. `COMPLETED` means the screenshot exists and its URLs are
          #   populated. `UNSUPPORTED`, `TIMED_OUT` and `FAILED` are all terminal, and none
          #   stands in for another — `UNSUPPORTED` means the device was retired at the
          #   vendor, `TIMED_OUT` means it did not report in time.
          #
          #   @return [Symbol, Courier::Models::Notifications::Previews::PreviewResultStatus]
          required :status, enum: -> { Courier::Notifications::Previews::PreviewResultStatus }

          # @!attribute thumbnail_url
          #   Short-lived signed URL for the grid-sized image. Null until the screenshot
          #   exists. Re-signed on every read, so fetch it rather than storing it.
          #
          #   @return [String, nil]
          required :thumbnail_url, String, nil?: true

          # @!attribute failure_reason
          #   Why one device's render failed, when its `status` is `FAILED` and the cause has
          #   a public name. `DELIVERY_FAILED` means the rendering service could not deliver
          #   the message to its own capture mailbox — infrastructure, not anything wrong with
          #   the template.
          #
          #   @return [Symbol, Courier::Models::Notifications::Previews::PreviewResultFailureReason, nil]
          optional :failure_reason, enum: -> { Courier::Notifications::Previews::PreviewResultFailureReason }

          # @!method initialize(device_id:, screenshot_url:, status:, thumbnail_url:, failure_reason: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::Notifications::Previews::PreviewResult} for more details.
          #
          #   One device's result within a preview run.
          #
          #   @param device_id [String] The device this result is for, by `PreviewDevice.id`.
          #
          #   @param screenshot_url [String, nil] Short-lived signed URL for the full-sized image. Null until the screenshot exist
          #
          #   @param status [Symbol, Courier::Models::Notifications::Previews::PreviewResultStatus] One device's outcome. `COMPLETED` means the screenshot exists and its URLs are p
          #
          #   @param thumbnail_url [String, nil] Short-lived signed URL for the grid-sized image. Null until the screenshot exist
          #
          #   @param failure_reason [Symbol, Courier::Models::Notifications::Previews::PreviewResultFailureReason] Why one device's render failed, when its `status` is `FAILED` and the cause has
        end
      end

      PreviewResult = Previews::PreviewResult
    end
  end
end
