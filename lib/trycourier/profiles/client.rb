# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/profile_get_response"
require_relative "types/merge_profile_response"
require_relative "types/replace_profile_response"
require_relative "types/get_list_subscriptions_response"
require_relative "types/subscribe_to_lists_request"
require_relative "types/subscribe_to_lists_response"
require_relative "types/delete_list_subscription_response"
require "async"

module Courier
  class ProfilesClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [ProfilesClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Returns the specified user profile.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param request_options [RequestOptions]
    # @return [Profiles::ProfileGetResponse]
    def get(user_id:, request_options: nil)
      response = @request_client.conn.get("/profiles/#{user_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Profiles::ProfileGetResponse.from_json(json_object: response.body)
    end

    # Merge the supplied values with an existing profile or create a new profile if one doesn't already exist.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param profile [Hash{String => String}]
    # @param request_options [IdempotencyRequestOptions]
    # @return [Profiles::MergeProfileResponse]
    def create(user_id:, profile:, request_options: nil)
      response = @request_client.conn.post("/profiles/#{user_id}") do |req|
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
        req.body = { **(request_options&.additional_body_parameters || {}), profile: profile }.compact
      end
      Profiles::MergeProfileResponse.from_json(json_object: response.body)
    end

    # When using `PUT`, be sure to include all the key-value pairs required by the recipient's profile.
    # Any key-value pairs that exist in the profile but fail to be included in the `PUT` request will be
    # removed from the profile. Remember, a `PUT` update is a full replacement of the data. For partial updates,
    # use the [Patch](https://www.courier.com/docs/reference/profiles/patch/) request.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param profile [Hash{String => String}]
    # @param request_options [RequestOptions]
    # @return [Profiles::ReplaceProfileResponse]
    def replace(user_id:, profile:, request_options: nil)
      response = @request_client.conn.put("/profiles/#{user_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), profile: profile }.compact
      end
      Profiles::ReplaceProfileResponse.from_json(json_object: response.body)
    end

    # Deletes the specified user profile.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(user_id:, request_options: nil)
      @request_client.conn.delete("/profiles/#{user_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end

    # Returns the subscribed lists for a specified user.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param cursor [String] A unique identifier that allows for fetching the next set of message statuses.
    # @param request_options [RequestOptions]
    # @return [Profiles::GetListSubscriptionsResponse]
    def get_list_subscriptions(user_id:, cursor: nil, request_options: nil)
      response = @request_client.conn.get("/profiles/#{user_id}/lists") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
      end
      Profiles::GetListSubscriptionsResponse.from_json(json_object: response.body)
    end

    # Subscribes the given user to one or more lists. If the list does not exist, it will be created.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param request [Hash] Request of type Profiles::SubscribeToListsRequest, as a Hash
    #   * :lists (Array<Profiles::SubscribeToListsRequestListObject>)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Profiles::SubscribeToListsResponse]
    def subscribe_to_lists(user_id:, request:, request_options: nil)
      response = @request_client.conn.post("/profiles/#{user_id}/lists") do |req|
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
      Profiles::SubscribeToListsResponse.from_json(json_object: response.body)
    end

    # Removes all list subscriptions for given user.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param request_options [RequestOptions]
    # @return [Profiles::DeleteListSubscriptionResponse]
    def delete_list_subscription(user_id:, request_options: nil)
      response = @request_client.conn.delete("/profiles/#{user_id}/lists") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Profiles::DeleteListSubscriptionResponse.from_json(json_object: response.body)
    end
  end

  class AsyncProfilesClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncProfilesClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Returns the specified user profile.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param request_options [RequestOptions]
    # @return [Profiles::ProfileGetResponse]
    def get(user_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/profiles/#{user_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Profiles::ProfileGetResponse.from_json(json_object: response.body)
      end
    end

    # Merge the supplied values with an existing profile or create a new profile if one doesn't already exist.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param profile [Hash{String => String}]
    # @param request_options [IdempotencyRequestOptions]
    # @return [Profiles::MergeProfileResponse]
    def create(user_id:, profile:, request_options: nil)
      Async do
        response = @request_client.conn.post("/profiles/#{user_id}") do |req|
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
          req.body = { **(request_options&.additional_body_parameters || {}), profile: profile }.compact
        end
        Profiles::MergeProfileResponse.from_json(json_object: response.body)
      end
    end

    # When using `PUT`, be sure to include all the key-value pairs required by the recipient's profile.
    # Any key-value pairs that exist in the profile but fail to be included in the `PUT` request will be
    # removed from the profile. Remember, a `PUT` update is a full replacement of the data. For partial updates,
    # use the [Patch](https://www.courier.com/docs/reference/profiles/patch/) request.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param profile [Hash{String => String}]
    # @param request_options [RequestOptions]
    # @return [Profiles::ReplaceProfileResponse]
    def replace(user_id:, profile:, request_options: nil)
      Async do
        response = @request_client.conn.put("/profiles/#{user_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), profile: profile }.compact
        end
        Profiles::ReplaceProfileResponse.from_json(json_object: response.body)
      end
    end

    # Deletes the specified user profile.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(user_id:, request_options: nil)
      Async do
        @request_client.conn.delete("/profiles/#{user_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end

    # Returns the subscribed lists for a specified user.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param cursor [String] A unique identifier that allows for fetching the next set of message statuses.
    # @param request_options [RequestOptions]
    # @return [Profiles::GetListSubscriptionsResponse]
    def get_list_subscriptions(user_id:, cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/profiles/#{user_id}/lists") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "cursor": cursor }.compact
        end
        Profiles::GetListSubscriptionsResponse.from_json(json_object: response.body)
      end
    end

    # Subscribes the given user to one or more lists. If the list does not exist, it will be created.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param request [Hash] Request of type Profiles::SubscribeToListsRequest, as a Hash
    #   * :lists (Array<Profiles::SubscribeToListsRequestListObject>)
    # @param request_options [IdempotencyRequestOptions]
    # @return [Profiles::SubscribeToListsResponse]
    def subscribe_to_lists(user_id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.post("/profiles/#{user_id}/lists") do |req|
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
        Profiles::SubscribeToListsResponse.from_json(json_object: response.body)
      end
    end

    # Removes all list subscriptions for given user.
    #
    # @param user_id [String] A unique identifier representing the user associated with the requested profile.
    # @param request_options [RequestOptions]
    # @return [Profiles::DeleteListSubscriptionResponse]
    def delete_list_subscription(user_id:, request_options: nil)
      Async do
        response = @request_client.conn.delete("/profiles/#{user_id}/lists") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Profiles::DeleteListSubscriptionResponse.from_json(json_object: response.body)
      end
    end
  end
end
