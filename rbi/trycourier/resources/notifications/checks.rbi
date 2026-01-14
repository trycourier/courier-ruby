# typed: strong

module Trycourier
  module Resources
    class Notifications
      class Checks
        sig do
          params(
            submission_id: String,
            id: String,
            checks: T::Array[Trycourier::BaseCheck::OrHash],
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(Trycourier::Models::Notifications::CheckUpdateResponse)
        end
        def update(
          # Path param
          submission_id,
          # Path param
          id:,
          # Body param
          checks:,
          request_options: {}
        )
        end

        sig do
          params(
            submission_id: String,
            id: String,
            request_options: Trycourier::RequestOptions::OrHash
          ).returns(Trycourier::Models::Notifications::CheckListResponse)
        end
        def list(submission_id, id:, request_options: {})
        end

        sig do
          params(
            submission_id: String,
            id: String,
            request_options: Trycourier::RequestOptions::OrHash
          ).void
        end
        def delete(submission_id, id:, request_options: {})
        end

        # @api private
        sig { params(client: Trycourier::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
