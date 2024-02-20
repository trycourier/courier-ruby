# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/inbound_bulk_message"
require_relative "types/bulk_create_job_response"
require_relative "types/bulk_ingest_users_params"
require_relative "types/bulk_get_job_response"
require_relative "types/bulk_get_job_users_response"
require "async"

module Courier
  class BulkClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [BulkClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # @param message [Hash] Request of type Bulk::InboundBulkMessage, as a Hash
    #   * :message (Hash)
    #   * :brand (String)
    #   * :data (Hash{String => String})
    #   * :event (String)
    #   * :locale (Hash{String => String})
    #   * :override (Object)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Bulk::BulkCreateJobResponse]
    def create_job(message:, request_options: nil)
      response = @request_client.conn.post("/bulk") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
        unless request_options&.idempotency_expiry.nil?
          req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), message: message }.compact
      end
      Bulk::BulkCreateJobResponse.from_json(json_object: response.body)
    end

    # Ingest user data into a Bulk Job
    #
    # @param job_id [String] A unique identifier representing the bulk job
    # @param request [Hash] Request of type Bulk::BulkIngestUsersParams, as a Hash
    #   * :users (Array<Bulk::InboundBulkMessageUser>)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Void]
    def ingest_users(job_id:, request:, request_options: nil)
      @request_client.conn.post("/bulk/#{job_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
        unless request_options&.idempotency_expiry.nil?
          req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
      end
    end

    # Run a bulk job
    #
    # @param job_id [String] A unique identifier representing the bulk job
    # @param request_options [IdempotencyRequestOptions]
    # @return [Void]
    def run_job(job_id:, request_options: nil)
      @request_client.conn.post("/bulk/#{job_id}/run") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
        unless request_options&.idempotency_expiry.nil?
          req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end

    # Get a bulk job
    #
    # @param job_id [String] A unique identifier representing the bulk job
    # @param request_options [RequestOptions]
    # @return [Bulk::BulkGetJobResponse]
    def get_job(job_id:, request_options: nil)
      response = @request_client.conn.get("/bulk/#{job_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Bulk::BulkGetJobResponse.from_json(json_object: response.body)
    end

    # Get Bulk Job Users
    #
    # @param job_id [String] A unique identifier representing the bulk job
    # @param request_options [RequestOptions]
    # @return [Bulk::BulkGetJobUsersResponse]
    def get_users(job_id:, request_options: nil)
      response = @request_client.conn.get("/bulk/#{job_id}/users") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Bulk::BulkGetJobUsersResponse.from_json(json_object: response.body)
    end
  end

  class AsyncBulkClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncBulkClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # @param message [Hash] Request of type Bulk::InboundBulkMessage, as a Hash
    #   * :message (Hash)
    #   * :brand (String)
    #   * :data (Hash{String => String})
    #   * :event (String)
    #   * :locale (Hash{String => String})
    #   * :override (Object)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Bulk::BulkCreateJobResponse]
    def create_job(message:, request_options: nil)
      Async do
        response = @request_client.conn.post("/bulk") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
          unless request_options&.idempotency_expiry.nil?
            req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), message: message }.compact
        end
        Bulk::BulkCreateJobResponse.from_json(json_object: response.body)
      end
    end

    # Ingest user data into a Bulk Job
    #
    # @param job_id [String] A unique identifier representing the bulk job
    # @param request [Hash] Request of type Bulk::BulkIngestUsersParams, as a Hash
    #   * :users (Array<Bulk::InboundBulkMessageUser>)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Void]
    def ingest_users(job_id:, request:, request_options: nil)
      Async do
        @request_client.conn.post("/bulk/#{job_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
          unless request_options&.idempotency_expiry.nil?
            req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
      end
    end

    # Run a bulk job
    #
    # @param job_id [String] A unique identifier representing the bulk job
    # @param request_options [IdempotencyRequestOptions]
    # @return [Void]
    def run_job(job_id:, request_options: nil)
      Async do
        @request_client.conn.post("/bulk/#{job_id}/run") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers["Idempotency-Key"] = request_options.idempotency_key unless request_options&.idempotency_key.nil?
          unless request_options&.idempotency_expiry.nil?
            req.headers["X-Idempotency-Expiration"] = request_options.idempotency_expiry
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end

    # Get a bulk job
    #
    # @param job_id [String] A unique identifier representing the bulk job
    # @param request_options [RequestOptions]
    # @return [Bulk::BulkGetJobResponse]
    def get_job(job_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/bulk/#{job_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Bulk::BulkGetJobResponse.from_json(json_object: response.body)
      end
    end

    # Get Bulk Job Users
    #
    # @param job_id [String] A unique identifier representing the bulk job
    # @param request_options [RequestOptions]
    # @return [Bulk::BulkGetJobUsersResponse]
    def get_users(job_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/bulk/#{job_id}/users") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Bulk::BulkGetJobUsersResponse.from_json(json_object: response.body)
      end
    end
  end
end
