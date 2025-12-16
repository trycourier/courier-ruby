# typed: strong

module Trycourier
  module Resources
    class Bulk
      # Ingest user data into a Bulk Job.
      #
      # **Important**: For email-based bulk jobs, each user must include `profile.email`
      # for provider routing to work correctly. The `to.email` field is not sufficient
      # for email provider routing.
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

      # Creates a new bulk job for sending messages to multiple recipients.
      #
      # **Required**: `message.event` (event ID or notification ID)
      #
      # **Optional (V2 format)**: `message.template` (notification ID) or
      # `message.content` (Elemental content) can be provided to override the
      # notification associated with the event.
      sig do
        params(
          message: Trycourier::InboundBulkMessage::OrHash,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::BulkCreateJobResponse)
      end
      def create_job(
        # Bulk message definition. Supports two formats:
        #
        # - V1 format: Requires `event` field (event ID or notification ID)
        # - V2 format: Optionally use `template` (notification ID) or `content` (Elemental
        #   content) in addition to `event`
        message:,
        request_options: {}
      )
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
