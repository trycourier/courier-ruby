# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/issue_token_response"
require "async"

module Courier
  class AuthTokensClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [AuthTokensClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Returns a new access token.
    #
    # @param scope [String]
    # @param expires_in [String]
    # @param request_options [RequestOptions]
    # @return [AuthTokens::IssueTokenResponse]
    def issue_token(scope:, expires_in:, request_options: nil)
      response = @request_client.conn.post("/auth/issue-token") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          scope: scope,
          expires_in: expires_in
        }.compact
      end
      AuthTokens::IssueTokenResponse.from_json(json_object: response.body)
    end
  end

  class AsyncAuthTokensClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncAuthTokensClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Returns a new access token.
    #
    # @param scope [String]
    # @param expires_in [String]
    # @param request_options [RequestOptions]
    # @return [AuthTokens::IssueTokenResponse]
    def issue_token(scope:, expires_in:, request_options: nil)
      Async do
        response = @request_client.conn.post("/auth/issue-token") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            scope: scope,
            expires_in: expires_in
          }.compact
        end
        AuthTokens::IssueTokenResponse.from_json(json_object: response.body)
      end
    end
  end
end
