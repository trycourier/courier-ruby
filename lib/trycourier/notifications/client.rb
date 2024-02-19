# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/notification_list_response"
require_relative "types/notification_get_content_response"
require_relative "types/notification_block"
require_relative "types/notification_channel"
require_relative "types/submission_checks_get_response"
require_relative "types/base_check"
require_relative "types/submission_checks_replace_response"
require "async"

module Courier
  class NotificationsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [NotificationsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # @param cursor [String]
    # @param request_options [RequestOptions]
    # @return [Notifications::NotificationListResponse]
    def list(cursor: nil, request_options: nil)
      response = @request_client.conn.get("/notifications") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
      end
      Notifications::NotificationListResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [RequestOptions]
    # @return [Notifications::NotificationGetContentResponse]
    def get_content(id:, request_options: nil)
      response = @request_client.conn.get("/notifications/#{id}/content") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Notifications::NotificationGetContentResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [RequestOptions]
    # @return [Notifications::NotificationGetContentResponse]
    def get_draft_content(id:, request_options: nil)
      response = @request_client.conn.get("/notifications/#{id}/draft/content") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Notifications::NotificationGetContentResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param blocks [Array<Hash>] Request of type Array<Notifications::NotificationBlock>, as a Hash
    #   * :alias_ (String)
    #   * :context (String)
    #   * :id (String)
    #   * :type (BLOCK_TYPE)
    #   * :content (Hash)
    #   * :locales (Hash{String => String})
    #   * :checksum (String)
    # @param channels [Array<Hash>] Request of type Array<Notifications::NotificationChannel>, as a Hash
    #   * :id (String)
    #   * :type (String)
    #   * :content (Hash)
    #     * :subject (String)
    #     * :title (String)
    #   * :locales (Hash{String => String})
    #   * :checksum (String)
    # @param request_options [RequestOptions]
    # @return [Void]
    def update_variations(id:, blocks: nil, channels: nil, request_options: nil)
      @request_client.conn.post("/notifications/#{id}/variations") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), blocks: blocks, channels: channels }.compact
      end
    end

    # @param id [String]
    # @param blocks [Array<Hash>] Request of type Array<Notifications::NotificationBlock>, as a Hash
    #   * :alias_ (String)
    #   * :context (String)
    #   * :id (String)
    #   * :type (BLOCK_TYPE)
    #   * :content (Hash)
    #   * :locales (Hash{String => String})
    #   * :checksum (String)
    # @param channels [Array<Hash>] Request of type Array<Notifications::NotificationChannel>, as a Hash
    #   * :id (String)
    #   * :type (String)
    #   * :content (Hash)
    #     * :subject (String)
    #     * :title (String)
    #   * :locales (Hash{String => String})
    #   * :checksum (String)
    # @param request_options [RequestOptions]
    # @return [Void]
    def update_draft_variations(id:, blocks: nil, channels: nil, request_options: nil)
      @request_client.conn.post("/notifications/#{id}/draft/variations") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), blocks: blocks, channels: channels }.compact
      end
    end

    # @param id [String]
    # @param submission_id [String]
    # @param request_options [RequestOptions]
    # @return [Notifications::SubmissionChecksGetResponse]
    def get_submission_checks(id:, submission_id:, request_options: nil)
      response = @request_client.conn.get("/notifications/#{id}/#{submission_id}/checks") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Notifications::SubmissionChecksGetResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param submission_id [String]
    # @param checks [Array<Hash>] Request of type Array<Notifications::BaseCheck>, as a Hash
    #   * :id (String)
    #   * :status (CHECK_STATUS)
    #   * :type (String)
    # @param request_options [RequestOptions]
    # @return [Notifications::SubmissionChecksReplaceResponse]
    def replace_submission_checks(id:, submission_id:, checks:, request_options: nil)
      response = @request_client.conn.put("/notifications/#{id}/#{submission_id}/checks") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), checks: checks }.compact
      end
      Notifications::SubmissionChecksReplaceResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param submission_id [String]
    # @param request_options [RequestOptions]
    # @return [Void]
    def cancel_submission(id:, submission_id:, request_options: nil)
      @request_client.conn.delete("/notifications/#{id}/#{submission_id}/checks") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end
  end

  class AsyncNotificationsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncNotificationsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # @param cursor [String]
    # @param request_options [RequestOptions]
    # @return [Notifications::NotificationListResponse]
    def list(cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/notifications") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
        end
        Notifications::NotificationListResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [RequestOptions]
    # @return [Notifications::NotificationGetContentResponse]
    def get_content(id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/notifications/#{id}/content") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Notifications::NotificationGetContentResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [RequestOptions]
    # @return [Notifications::NotificationGetContentResponse]
    def get_draft_content(id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/notifications/#{id}/draft/content") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Notifications::NotificationGetContentResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param blocks [Array<Hash>] Request of type Array<Notifications::NotificationBlock>, as a Hash
    #   * :alias_ (String)
    #   * :context (String)
    #   * :id (String)
    #   * :type (BLOCK_TYPE)
    #   * :content (Hash)
    #   * :locales (Hash{String => String})
    #   * :checksum (String)
    # @param channels [Array<Hash>] Request of type Array<Notifications::NotificationChannel>, as a Hash
    #   * :id (String)
    #   * :type (String)
    #   * :content (Hash)
    #     * :subject (String)
    #     * :title (String)
    #   * :locales (Hash{String => String})
    #   * :checksum (String)
    # @param request_options [RequestOptions]
    # @return [Void]
    def update_variations(id:, blocks: nil, channels: nil, request_options: nil)
      Async do
        @request_client.conn.post("/notifications/#{id}/variations") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            blocks: blocks,
            channels: channels
          }.compact
        end
      end
    end

    # @param id [String]
    # @param blocks [Array<Hash>] Request of type Array<Notifications::NotificationBlock>, as a Hash
    #   * :alias_ (String)
    #   * :context (String)
    #   * :id (String)
    #   * :type (BLOCK_TYPE)
    #   * :content (Hash)
    #   * :locales (Hash{String => String})
    #   * :checksum (String)
    # @param channels [Array<Hash>] Request of type Array<Notifications::NotificationChannel>, as a Hash
    #   * :id (String)
    #   * :type (String)
    #   * :content (Hash)
    #     * :subject (String)
    #     * :title (String)
    #   * :locales (Hash{String => String})
    #   * :checksum (String)
    # @param request_options [RequestOptions]
    # @return [Void]
    def update_draft_variations(id:, blocks: nil, channels: nil, request_options: nil)
      Async do
        @request_client.conn.post("/notifications/#{id}/draft/variations") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            blocks: blocks,
            channels: channels
          }.compact
        end
      end
    end

    # @param id [String]
    # @param submission_id [String]
    # @param request_options [RequestOptions]
    # @return [Notifications::SubmissionChecksGetResponse]
    def get_submission_checks(id:, submission_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/notifications/#{id}/#{submission_id}/checks") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Notifications::SubmissionChecksGetResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param submission_id [String]
    # @param checks [Array<Hash>] Request of type Array<Notifications::BaseCheck>, as a Hash
    #   * :id (String)
    #   * :status (CHECK_STATUS)
    #   * :type (String)
    # @param request_options [RequestOptions]
    # @return [Notifications::SubmissionChecksReplaceResponse]
    def replace_submission_checks(id:, submission_id:, checks:, request_options: nil)
      Async do
        response = @request_client.conn.put("/notifications/#{id}/#{submission_id}/checks") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), checks: checks }.compact
        end
        Notifications::SubmissionChecksReplaceResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param submission_id [String]
    # @param request_options [RequestOptions]
    # @return [Void]
    def cancel_submission(id:, submission_id:, request_options: nil)
      Async do
        @request_client.conn.delete("/notifications/#{id}/#{submission_id}/checks") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end
  end
end
