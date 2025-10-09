# typed: strong

module Trycourier
  module Resources
    class Bulk
      # Ingest user data into a Bulk Job
      sig do
        params(
          job_id: String,
          users: T::Array[Trycourier::InboundBulkMessageUser::OrHash],
          request_options: Trycourier::RequestOptions::OrHash
        ).void
      end
      def add_users(
        # A unique identifier representing the bulk job
        job_id,
        users:,
        request_options: {}
      )
      end

      # Create a bulk job
      sig do
        params(
          message:
            T.any(
              Trycourier::InboundBulkMessage::InboundBulkTemplateMessage::OrHash,
              Trycourier::InboundBulkMessage::InboundBulkContentMessage::OrHash
            ),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::BulkCreateJobResponse)
      end
      def create_job(message:, request_options: {})
      end

      # Get Bulk Job Users
      sig do
        params(
          job_id: String,
          cursor: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::BulkListUsersResponse)
      end
      def list_users(
        # A unique identifier representing the bulk job
        job_id,
        # A unique identifier that allows for fetching the next set of users added to the
        # bulk job
        cursor: nil,
        request_options: {}
      )
      end

      # Get a bulk job
      sig do
        params(
          job_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::BulkRetrieveJobResponse)
      end
      def retrieve_job(
        # A unique identifier representing the bulk job
        job_id,
        request_options: {}
      )
      end

      # Run a bulk job
      sig do
        params(
          job_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).void
      end
      def run_job(
        # A unique identifier representing the bulk job
        job_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
