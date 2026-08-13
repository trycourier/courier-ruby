# typed: strong

module Courier
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
          users: T::Array[Courier::InboundBulkMessageUser::OrHash],
          request_options: Courier::RequestOptions::OrHash
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
          message: Courier::InboundBulkMessage::OrHash,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::BulkCreateJobResponse)
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

      # Returns the users ingested into a bulk job with paging, each carrying the status
      # Courier recorded for it and the id of the message it produced.
      sig do
        params(
          job_id: String,
          cursor: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::BulkListUsersResponse)
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

      # Returns a bulk job's message definition, its status — CREATED, PROCESSING,
      # COMPLETED, or ERROR — and running counts of users received, messages enqueued,
      # and failures. Poll it to follow a job through to completion.
      sig do
        params(
          job_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::BulkRetrieveJobResponse)
      end
      def retrieve_job(
        # A unique identifier representing the bulk job
        job_id,
        request_options: {}
      )
      end

      # Starts processing a bulk job, sending to every user ingested into it. Returns
      # 204 immediately; the job runs asynchronously, so poll the job to watch its
      # status and counts.
      sig do
        params(
          job_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def run_job(
        # A unique identifier representing the bulk job
        job_id,
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
