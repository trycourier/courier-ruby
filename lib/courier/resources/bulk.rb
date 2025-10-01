# frozen_string_literal: true

module Courier
  module Resources
    class Bulk
      # Ingest user data into a Bulk Job
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

      # Create a bulk job
      #
      # @overload create_job(message:, request_options: {})
      #
      # @param message [Courier::Models::InboundBulkMessage]
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
      # Get Bulk Job Users
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
        @client.request(
          method: :get,
          path: ["bulk/%1$s/users", job_id],
          query: parsed,
          model: Courier::Models::BulkListUsersResponse,
          options: options
        )
      end

      # Get a bulk job
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

      # Run a bulk job
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
