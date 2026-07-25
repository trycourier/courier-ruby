# typed: strong

module Courier
  module Resources
    class Notifications
      class Checks
        # Replaces the approval checks on a template submission with the complete set
        # supplied in the request body.
        sig do
          params(
            submission_id: String,
            id: String,
            checks: T::Array[Courier::BaseCheck::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Notifications::CheckUpdateResponse)
        end
        def update(
          # Path param: Submission ID.
          submission_id,
          # Path param: Notification template ID.
          id:,
          # Body param
          checks:,
          request_options: {}
        )
        end

        # Returns the approval checks recorded for a template submission, each with its
        # pass or fail result.
        sig do
          params(
            submission_id: String,
            id: String,
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Notifications::CheckListResponse)
        end
        def list(
          # Submission ID.
          submission_id,
          # Notification template ID.
          id:,
          request_options: {}
        )
        end

        # Cancels a pending template submission, withdrawing it from the approval
        # workflow. The template stays in draft and can be resubmitted later.
        sig do
          params(
            submission_id: String,
            id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Submission ID.
          submission_id,
          # Notification template ID.
          id:,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Courier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
