# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/user_preferences_list_response"
require_relative "types/user_preferences_get_response"
require_relative "types/topic_preference_update"
require_relative "types/user_preferences_update_response"
require "async"

module Courier
  module Users
    class PreferencesClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Users::PreferencesClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Fetch all user preferences.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param tenant_id [String] Query the preferences of a user for this specific tenant context.
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesListResponse]
      def list(user_id:, tenant_id: nil, request_options: nil)
        response = @request_client.conn.get("/users/#{user_id}/preferences") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "tenant_id": tenant_id }.compact
        end
        Users::Preferences::UserPreferencesListResponse.from_json(json_object: response.body)
      end

      # Fetch user preferences for a specific subscription topic.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param topic_id [String] A unique identifier associated with a subscription topic.
      # @param tenant_id [String] Query the preferences of a user for this specific tenant context.
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesGetResponse]
      def get(user_id:, topic_id:, tenant_id: nil, request_options: nil)
        response = @request_client.conn.get("/users/#{user_id}/preferences/#{topic_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "tenant_id": tenant_id }.compact
        end
        Users::Preferences::UserPreferencesGetResponse.from_json(json_object: response.body)
      end

      # Update or Create user preferences for a specific subscription topic.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param topic_id [String] A unique identifier associated with a subscription topic.
      # @param tenant_id [String] Update the preferences of a user for this specific tenant context.
      # @param topic [Hash] Request of type Users::Preferences::TopicPreferenceUpdate, as a Hash
      #   * :status (Commons::PreferenceStatus)
      #   * :custom_routing (Array<Commons::ChannelClassification>)
      #   * :has_custom_routing (Boolean)
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesUpdateResponse]
      def update(user_id:, topic_id:, topic:, tenant_id: nil, request_options: nil)
        response = @request_client.conn.put("/users/#{user_id}/preferences/#{topic_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "tenant_id": tenant_id }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), topic: topic }.compact
        end
        Users::Preferences::UserPreferencesUpdateResponse.from_json(json_object: response.body)
      end
    end

    class AsyncPreferencesClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Users::AsyncPreferencesClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Fetch all user preferences.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param tenant_id [String] Query the preferences of a user for this specific tenant context.
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesListResponse]
      def list(user_id:, tenant_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/users/#{user_id}/preferences") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = { **(request_options&.additional_query_parameters || {}), "tenant_id": tenant_id }.compact
          end
          Users::Preferences::UserPreferencesListResponse.from_json(json_object: response.body)
        end
      end

      # Fetch user preferences for a specific subscription topic.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param topic_id [String] A unique identifier associated with a subscription topic.
      # @param tenant_id [String] Query the preferences of a user for this specific tenant context.
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesGetResponse]
      def get(user_id:, topic_id:, tenant_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/users/#{user_id}/preferences/#{topic_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = { **(request_options&.additional_query_parameters || {}), "tenant_id": tenant_id }.compact
          end
          Users::Preferences::UserPreferencesGetResponse.from_json(json_object: response.body)
        end
      end

      # Update or Create user preferences for a specific subscription topic.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param topic_id [String] A unique identifier associated with a subscription topic.
      # @param tenant_id [String] Update the preferences of a user for this specific tenant context.
      # @param topic [Hash] Request of type Users::Preferences::TopicPreferenceUpdate, as a Hash
      #   * :status (Commons::PreferenceStatus)
      #   * :custom_routing (Array<Commons::ChannelClassification>)
      #   * :has_custom_routing (Boolean)
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesUpdateResponse]
      def update(user_id:, topic_id:, topic:, tenant_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.put("/users/#{user_id}/preferences/#{topic_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = { **(request_options&.additional_query_parameters || {}), "tenant_id": tenant_id }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), topic: topic }.compact
          end
          Users::Preferences::UserPreferencesUpdateResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
