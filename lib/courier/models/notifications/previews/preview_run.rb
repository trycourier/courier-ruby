# frozen_string_literal: true

module Courier
  module Models
    module Notifications
      module Previews
        # @see Courier::Resources::Notifications::Previews::Runs#create
        class PreviewRun < Courier::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for the preview run.
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   ISO-8601 timestamp of when the run was created.
          #
          #   @return [String]
          required :created_at, String

          # @!attribute device_ids
          #   The devices this run was submitted for, snapshotted when the run was created.
          #
          #   @return [Array<String>]
          required :device_ids, Courier::Internal::Type::ArrayOf[String]

          # @!attribute status
          #   Where the run itself has got to. `PENDING` and `RENDERED` mean Courier is still
          #   preparing the email, `SUBMITTED` means it is with the rendering service, and
          #   `COMPLETED` means every device has reported. `FAILED` is the run as a whole
          #   failing — an individual device failing never fails the run.
          #
          #   @return [Symbol, Courier::Models::Notifications::Previews::PreviewRunStatus]
          required :status, enum: -> { Courier::Notifications::Previews::PreviewRunStatus }

          # @!attribute template_id
          #   The template that was rendered.
          #
          #   @return [String]
          required :template_id, String

          # @!attribute failure_reason
          #   Why the run failed, when `status` is `FAILED`. `NO_EMAIL_CHANNEL` and
          #   `TEMPLATE_NOT_SUPPORTED` mean there was nothing to render;
          #   `ALL_DEVICES_UNSUPPORTED` means every requested device has been retired and the
          #   request can be fixed by choosing others.
          #
          #   @return [Symbol, Courier::Models::Notifications::Previews::PreviewRunFailureReason, nil]
          optional :failure_reason, enum: -> { Courier::Notifications::Previews::PreviewRunFailureReason }

          # @!attribute template_version
          #   The version of the template that was rendered — `draft`, or a zero-padded
          #   published version such as `v002`. Absent until the render settles.
          #
          #   @return [String, nil]
          optional :template_version, String

          # @!method initialize(id:, created_at:, device_ids:, status:, template_id:, failure_reason: nil, template_version: nil)
          #   Some parameter documentations has been truncated, see
          #   {Courier::Models::Notifications::Previews::PreviewRun} for more details.
          #
          #   One render of a template across a set of devices. Billable.
          #
          #   @param id [String] Unique identifier for the preview run.
          #
          #   @param created_at [String] ISO-8601 timestamp of when the run was created.
          #
          #   @param device_ids [Array<String>] The devices this run was submitted for, snapshotted when the run was created.
          #
          #   @param status [Symbol, Courier::Models::Notifications::Previews::PreviewRunStatus] Where the run itself has got to. `PENDING` and `RENDERED` mean Courier is still
          #
          #   @param template_id [String] The template that was rendered.
          #
          #   @param failure_reason [Symbol, Courier::Models::Notifications::Previews::PreviewRunFailureReason] Why the run failed, when `status` is `FAILED`. `NO_EMAIL_CHANNEL` and
          #   `TEMPLATE\_
          #
          #   @param template_version [String] The version of the template that was rendered — `draft`, or a zero-padded publis
        end
      end

      PreviewRun = Previews::PreviewRun
    end
  end
end
