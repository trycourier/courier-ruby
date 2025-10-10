# frozen_string_literal: true

module Trycourier
  module Resources
    class Bulk
      # Ingest user data into a Bulk Job
      #
      # @overload add_users(job_id, users:, request_options: {})
      #
      # @param job_id [String] A unique identifier representing the bulk job
      #
      # @param users [Array<Trycourier::Models::InboundBulkMessageUser>]
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::BulkAddUsersParams
      def add_users(job_id, params)
        parsed, options = Trycourier::BulkAddUsersParams.dump_request(params)
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
      # @param message [Trycourier::Models::InboundBulkMessage::InboundBulkTemplateMessage, Trycourier::Models::InboundBulkMessage::InboundBulkContentMessage]
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::BulkCreateJobResponse]
      #
      # @see Trycourier::Models::BulkCreateJobParams
      def create_job(params)
        parsed, options = Trycourier::BulkCreateJobParams.dump_request(params)
        @client.request(
          method: :post,
          path: "bulk",
          body: parsed,
          model: Trycourier::Models::BulkCreateJobResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::BulkListUsersParams} for more details.
      #
      # Get Bulk Job Users
      #
      # @overload list_users(job_id, cursor: nil, request_options: {})
      #
      # @param job_id [String] A unique identifier representing the bulk job
      #
      # @param cursor [String, nil] A unique identifier that allows for fetching the next set of users added to the
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::BulkListUsersResponse]
      #
      # @see Trycourier::Models::BulkListUsersParams
      def list_users(job_id, params = {})
        parsed, options = Trycourier::BulkListUsersParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["bulk/%1$s/users", job_id],
          query: parsed,
          model: Trycourier::Models::BulkListUsersResponse,
          options: options
        )
      end

      # Get a bulk job
      #
      # @overload retrieve_job(job_id, request_options: {})
      #
      # @param job_id [String] A unique identifier representing the bulk job
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::BulkRetrieveJobResponse]
      #
      # @see Trycourier::Models::BulkRetrieveJobParams
      def retrieve_job(job_id, params = {})
        @client.request(
          method: :get,
          path: ["bulk/%1$s", job_id],
          model: Trycourier::Models::BulkRetrieveJobResponse,
          options: params[:request_options]
        )
      end

      # Run a bulk job
      #
      # @overload run_job(job_id, request_options: {})
      #
      # @param job_id [String] A unique identifier representing the bulk job
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::BulkRunJobParams
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
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
