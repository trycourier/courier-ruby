# frozen_string_literal: true

module Courier
  module Resources
    class Bulk
      # Ingest user data into a Bulk Job.
      #
      # **Important**: For email-based bulk jobs, each user must include `profile.email`
      # for provider routing to work correctly. The `to.email` field is not sufficient
      # for email provider routing.
      #
      # @overload add_users(job_id, users:, request_options: {})
      #
      # @param job_id [String] A unique identifier representing the bulk job
      #
      # @param users [Array<Courier::Models::InboundBulkMessageUser>]
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::BulkAddUsersParams
      def add_users(job_id, params)
        parsed, options = Courier::BulkAddUsersParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["bulk/%1$s", job_id],
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::BulkCreateJobParams} for more details.
      #
      # Creates a new bulk job for sending messages to multiple recipients.
      #
      # **Required**: `message.event` (event ID or notification ID)
      #
      # **Optional (V2 format)**: `message.template` (notification ID) or
      # `message.content` (Elemental content) can be provided to override the
      # notification associated with the event.
      #
      # @overload create_job(message:, request_options: {})
      #
      # @param message [Courier::Models::InboundBulkMessage] Bulk message definition. Supports two formats:
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::BulkCreateJobResponse]
      #
      # @see Courier::Models::BulkCreateJobParams
      def create_job(params)
        parsed, options = Courier::BulkCreateJobParams.dump_request(params)
        @client.request(
          method: :post,
          path: "bulk",
          body: parsed,
          model: Courier::Models::BulkCreateJobResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::BulkListUsersParams} for more details.
      #
      # Returns the users ingested into a bulk job with paging, each carrying the status
      # Courier recorded for it and the id of the message it produced.
      #
      # @overload list_users(job_id, cursor: nil, request_options: {})
      #
      # @param job_id [String] A unique identifier representing the bulk job
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of users added to the
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::BulkListUsersResponse]
      #
      # @see Courier::Models::BulkListUsersParams
      def list_users(job_id, params = {})
        parsed, options = Courier::BulkListUsersParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["bulk/%1$s/users", job_id],
          query: query,
          model: Courier::Models::BulkListUsersResponse,
          options: options
        )
      end

      # Returns a bulk job's message definition, its status — CREATED, PROCESSING,
      # COMPLETED, or ERROR — and running counts of users received, messages enqueued,
      # and failures. Poll it to follow a job through to completion.
      #
      # @overload retrieve_job(job_id, request_options: {})
      #
      # @param job_id [String] A unique identifier representing the bulk job
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::BulkRetrieveJobResponse]
      #
      # @see Courier::Models::BulkRetrieveJobParams
      def retrieve_job(job_id, params = {})
        @client.request(
          method: :get,
          path: ["bulk/%1$s", job_id],
          model: Courier::Models::BulkRetrieveJobResponse,
          options: params[:request_options]
        )
      end

      # Starts processing a bulk job, sending to every user ingested into it. Returns
      # 204 immediately; the job runs asynchronously, so poll the job to watch its
      # status and counts.
      #
      # @overload run_job(job_id, request_options: {})
      #
      # @param job_id [String] A unique identifier representing the bulk job
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::BulkRunJobParams
      def run_job(job_id, params = {})
        @client.request(
          method: :post,
          path: ["bulk/%1$s/run", job_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
