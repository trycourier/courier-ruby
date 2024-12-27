# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/list_get_all_response"
require_relative "types/list"
require_relative "types/list_put_params"
require_relative "types/list_get_subscriptions_response"
require_relative "types/put_subscriptions_recipient"
require_relative "../commons/types/recipient_preferences"
require "async"

module Courier
  class ListsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [ListsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Returns all of the lists, with the ability to filter based on a pattern.
    #
    # @param cursor [String] A unique identifier that allows for fetching the next page of lists.
    # @param pattern [String] "A pattern used to filter the list items returned. Pattern types supported: exact match on `list_id` or a pattern of one or more pattern parts. you may replace a part with either: `*` to match all parts in that position, or `**` to signify a wildcard `endsWith` pattern match."
    # @param request_options [RequestOptions]
    # @return [Lists::ListGetAllResponse]
    def list(cursor: nil, pattern: nil, request_options: nil)
      response = @request_client.conn.get("/lists") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "cursor": cursor,
          "pattern": pattern
        }.compact
      end
      Lists::ListGetAllResponse.from_json(json_object: response.body)
    end

    # Returns a list based on the list ID provided.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Lists::List]
    def get(list_id:, request_options: nil)
      response = @request_client.conn.get("/lists/#{list_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Lists::List.from_json(json_object: response.body)
    end

    # Create or replace an existing list with the supplied values.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param request [Hash] Request of type Lists::ListPutParams, as a Hash
    #   * :name (String)
    #   * :preferences (Hash)
    #     * :categories (Commons::NOTIFICATION_PREFERENCES)
    #     * :notifications (Commons::NOTIFICATION_PREFERENCES)
    # @param request_options [RequestOptions]
    # @return [Lists::List]
    def update(list_id:, request:, request_options: nil)
      response = @request_client.conn.put("/lists/#{list_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
      end
      Lists::List.from_json(json_object: response.body)
    end

    # Delete a list by list ID.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(list_id:, request_options: nil)
      @request_client.conn.delete("/lists/#{list_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end

    # Restore a previously deleted list.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Void]
    def restore(list_id:, request_options: nil)
      @request_client.conn.put("/lists/#{list_id}/restore") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end

    # Get the list's subscriptions.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param cursor [String] A unique identifier that allows for fetching the next set of list subscriptions
    # @param request_options [RequestOptions]
    # @return [Lists::ListGetSubscriptionsResponse]
    def get_subscribers(list_id:, cursor: nil, request_options: nil)
      response = @request_client.conn.get("/lists/#{list_id}/subscriptions") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
      end
      Lists::ListGetSubscriptionsResponse.from_json(json_object: response.body)
    end

    # Subscribes the users to the list, overwriting existing subscriptions. If the list does not exist, it will be automatically created.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param recipients [Array<Hash>] Request of type Array<Lists::PutSubscriptionsRecipient>, as a Hash
    #   * :recipient_id (String)
    #   * :preferences (Hash)
    #     * :categories (Commons::NOTIFICATION_PREFERENCES)
    #     * :notifications (Commons::NOTIFICATION_PREFERENCES)
    # @param request_options [RequestOptions]
    # @return [Void]
    def update_subscribers(list_id:, recipients:, request_options: nil)
      @request_client.conn.put("/lists/#{list_id}/subscriptions") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), recipients: recipients }.compact
      end
    end

    # Subscribes additional users to the list, without modifying existing subscriptions. If the list does not exist, it will be automatically created.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param recipients [Array<Hash>] Request of type Array<Lists::PutSubscriptionsRecipient>, as a Hash
    #   * :recipient_id (String)
    #   * :preferences (Hash)
    #     * :categories (Commons::NOTIFICATION_PREFERENCES)
    #     * :notifications (Commons::NOTIFICATION_PREFERENCES)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Void]
    def add_subscribers(list_id:, recipients:, request_options: nil)
      @request_client.conn.post("/lists/#{list_id}/subscriptions") do |req|
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
        req.body = { **(request_options&.additional_body_parameters || {}), recipients: recipients }.compact
      end
    end

    # Subscribe a user to an existing list (note: if the List does not exist, it will be automatically created).
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param user_id [String] A unique identifier representing the recipient associated with the list
    # @param preferences [Hash] Request of type Commons::RecipientPreferences, as a Hash
    #   * :categories (Commons::NOTIFICATION_PREFERENCES)
    #   * :notifications (Commons::NOTIFICATION_PREFERENCES)
    # @param request_options [RequestOptions]
    # @return [Void]
    def subscribe(list_id:, user_id:, preferences: nil, request_options: nil)
      @request_client.conn.put("/lists/#{list_id}/subscriptions/#{user_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), preferences: preferences }.compact
      end
    end

    # Delete a subscription to a list by list ID and user ID.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param user_id [String] A unique identifier representing the recipient associated with the list
    # @param request_options [RequestOptions]
    # @return [Void]
    def unsubscribe(list_id:, user_id:, request_options: nil)
      @request_client.conn.delete("/lists/#{list_id}/subscriptions/#{user_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end
  end

  class AsyncListsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncListsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Returns all of the lists, with the ability to filter based on a pattern.
    #
    # @param cursor [String] A unique identifier that allows for fetching the next page of lists.
    # @param pattern [String] "A pattern used to filter the list items returned. Pattern types supported: exact match on `list_id` or a pattern of one or more pattern parts. you may replace a part with either: `*` to match all parts in that position, or `**` to signify a wildcard `endsWith` pattern match."
    # @param request_options [RequestOptions]
    # @return [Lists::ListGetAllResponse]
    def list(cursor: nil, pattern: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/lists") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "cursor": cursor,
            "pattern": pattern
          }.compact
        end
        Lists::ListGetAllResponse.from_json(json_object: response.body)
      end
    end

    # Returns a list based on the list ID provided.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Lists::List]
    def get(list_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/lists/#{list_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Lists::List.from_json(json_object: response.body)
      end
    end

    # Create or replace an existing list with the supplied values.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param request [Hash] Request of type Lists::ListPutParams, as a Hash
    #   * :name (String)
    #   * :preferences (Hash)
    #     * :categories (Commons::NOTIFICATION_PREFERENCES)
    #     * :notifications (Commons::NOTIFICATION_PREFERENCES)
    # @param request_options [RequestOptions]
    # @return [Lists::List]
    def update(list_id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.put("/lists/#{list_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
        Lists::List.from_json(json_object: response.body)
      end
    end

    # Delete a list by list ID.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(list_id:, request_options: nil)
      Async do
        @request_client.conn.delete("/lists/#{list_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end

    # Restore a previously deleted list.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param request_options [RequestOptions]
    # @return [Void]
    def restore(list_id:, request_options: nil)
      Async do
        @request_client.conn.put("/lists/#{list_id}/restore") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end

    # Get the list's subscriptions.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param cursor [String] A unique identifier that allows for fetching the next set of list subscriptions
    # @param request_options [RequestOptions]
    # @return [Lists::ListGetSubscriptionsResponse]
    def get_subscribers(list_id:, cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/lists/#{list_id}/subscriptions") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
        end
        Lists::ListGetSubscriptionsResponse.from_json(json_object: response.body)
      end
    end

    # Subscribes the users to the list, overwriting existing subscriptions. If the list does not exist, it will be automatically created.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param recipients [Array<Hash>] Request of type Array<Lists::PutSubscriptionsRecipient>, as a Hash
    #   * :recipient_id (String)
    #   * :preferences (Hash)
    #     * :categories (Commons::NOTIFICATION_PREFERENCES)
    #     * :notifications (Commons::NOTIFICATION_PREFERENCES)
    # @param request_options [RequestOptions]
    # @return [Void]
    def update_subscribers(list_id:, recipients:, request_options: nil)
      Async do
        @request_client.conn.put("/lists/#{list_id}/subscriptions") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), recipients: recipients }.compact
        end
      end
    end

    # Subscribes additional users to the list, without modifying existing subscriptions. If the list does not exist, it will be automatically created.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param recipients [Array<Hash>] Request of type Array<Lists::PutSubscriptionsRecipient>, as a Hash
    #   * :recipient_id (String)
    #   * :preferences (Hash)
    #     * :categories (Commons::NOTIFICATION_PREFERENCES)
    #     * :notifications (Commons::NOTIFICATION_PREFERENCES)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Void]
    def add_subscribers(list_id:, recipients:, request_options: nil)
      Async do
        @request_client.conn.post("/lists/#{list_id}/subscriptions") do |req|
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
          req.body = { **(request_options&.additional_body_parameters || {}), recipients: recipients }.compact
        end
      end
    end

    # Subscribe a user to an existing list (note: if the List does not exist, it will be automatically created).
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param user_id [String] A unique identifier representing the recipient associated with the list
    # @param preferences [Hash] Request of type Commons::RecipientPreferences, as a Hash
    #   * :categories (Commons::NOTIFICATION_PREFERENCES)
    #   * :notifications (Commons::NOTIFICATION_PREFERENCES)
    # @param request_options [RequestOptions]
    # @return [Void]
    def subscribe(list_id:, user_id:, preferences: nil, request_options: nil)
      Async do
        @request_client.conn.put("/lists/#{list_id}/subscriptions/#{user_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), preferences: preferences }.compact
        end
      end
    end

    # Delete a subscription to a list by list ID and user ID.
    #
    # @param list_id [String] A unique identifier representing the list you wish to retrieve.
    # @param user_id [String] A unique identifier representing the recipient associated with the list
    # @param request_options [RequestOptions]
    # @return [Void]
    def unsubscribe(list_id:, user_id:, request_options: nil)
      Async do
        @request_client.conn.delete("/lists/#{list_id}/subscriptions/#{user_id}") do |req|
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
