# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/user_token"
require_relative "types/patch_user_token_opts"
require_relative "types/get_user_token_response"
require_relative "types/get_all_tokens_response"
require "async"

module Courier
  module Users
    class TokensClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Users::TokensClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Adds multiple tokens to a user and overwrites matching existing tokens.
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param request_options [RequestOptions]
      # @return [Void]
      def add_multiple(user_id:, request_options: nil)
        @request_client.conn.put("/users/#{user_id}/tokens") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end

      # Adds a single token to a user and overwrites a matching existing token.
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param token [String] The full token string.
      # @param request [Hash] Request of type Users::Tokens::UserToken, as a Hash
      #   * :token (String)
      #   * :provider_key (PROVIDER_KEY)
      #   * :expiry_date (Hash)
      #   * :properties (Object)
      #   * :device (Hash)
      #     * :app_id (String)
      #     * :ad_id (String)
      #     * :device_id (String)
      #     * :platform (String)
      #     * :manufacturer (String)
      #     * :model (String)
      #   * :tracking (Hash)
      #     * :os_version (String)
      #     * :ip (String)
      #     * :lat (String)
      #     * :long (String)
      # @param request_options [RequestOptions]
      # @return [Void]
      def add(user_id:, token:, request:, request_options: nil)
        @request_client.conn.put("/users/#{user_id}/tokens/#{token}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
      end

      # Apply a JSON Patch (RFC 6902) to the specified token.
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param token [String] The full token string.
      # @param request [Hash] Request of type Users::Tokens::PatchUserTokenOpts, as a Hash
      #   * :patch (Array<Users::Tokens::PatchOperation>)
      # @param request_options [RequestOptions]
      # @return [Void]
      def update(user_id:, token:, request:, request_options: nil)
        @request_client.conn.patch("/users/#{user_id}/tokens/#{token}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
      end

      # Get single token available for a `:token`
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param token [String] The full token string.
      # @param request_options [RequestOptions]
      # @return [Users::Tokens::GetUserTokenResponse]
      def get(user_id:, token:, request_options: nil)
        response = @request_client.conn.get("/users/#{user_id}/tokens/#{token}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Users::Tokens::GetUserTokenResponse.from_json(json_object: response.body)
      end

      # Gets all tokens available for a :user_id
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param request_options [RequestOptions]
      # @return [Users::Tokens::GET_ALL_TOKENS_RESPONSE]
      def list(user_id:, request_options: nil)
        response = @request_client.conn.get("/users/#{user_id}/tokens") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        return if response.body.nil?

        response.body.map do |v|
          v = v.to_json
          Users::Tokens::UserToken.from_json(json_object: v)
        end
      end
    end

    class AsyncTokensClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Users::AsyncTokensClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Adds multiple tokens to a user and overwrites matching existing tokens.
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param request_options [RequestOptions]
      # @return [Void]
      def add_multiple(user_id:, request_options: nil)
        Async do
          @request_client.conn.put("/users/#{user_id}/tokens") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end
      end

      # Adds a single token to a user and overwrites a matching existing token.
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param token [String] The full token string.
      # @param request [Hash] Request of type Users::Tokens::UserToken, as a Hash
      #   * :token (String)
      #   * :provider_key (PROVIDER_KEY)
      #   * :expiry_date (Hash)
      #   * :properties (Object)
      #   * :device (Hash)
      #     * :app_id (String)
      #     * :ad_id (String)
      #     * :device_id (String)
      #     * :platform (String)
      #     * :manufacturer (String)
      #     * :model (String)
      #   * :tracking (Hash)
      #     * :os_version (String)
      #     * :ip (String)
      #     * :lat (String)
      #     * :long (String)
      # @param request_options [RequestOptions]
      # @return [Void]
      def add(user_id:, token:, request:, request_options: nil)
        Async do
          @request_client.conn.put("/users/#{user_id}/tokens/#{token}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
        end
      end

      # Apply a JSON Patch (RFC 6902) to the specified token.
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param token [String] The full token string.
      # @param request [Hash] Request of type Users::Tokens::PatchUserTokenOpts, as a Hash
      #   * :patch (Array<Users::Tokens::PatchOperation>)
      # @param request_options [RequestOptions]
      # @return [Void]
      def update(user_id:, token:, request:, request_options: nil)
        Async do
          @request_client.conn.patch("/users/#{user_id}/tokens/#{token}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
        end
      end

      # Get single token available for a `:token`
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param token [String] The full token string.
      # @param request_options [RequestOptions]
      # @return [Users::Tokens::GetUserTokenResponse]
      def get(user_id:, token:, request_options: nil)
        Async do
          response = @request_client.conn.get("/users/#{user_id}/tokens/#{token}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Users::Tokens::GetUserTokenResponse.from_json(json_object: response.body)
        end
      end

      # Gets all tokens available for a :user_id
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param request_options [RequestOptions]
      # @return [Users::Tokens::GET_ALL_TOKENS_RESPONSE]
      def list(user_id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/users/#{user_id}/tokens") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          response.body&.map do |v|
            v = v.to_json
            Users::Tokens::UserToken.from_json(json_object: v)
          end
        end
      end
    end
  end
end
