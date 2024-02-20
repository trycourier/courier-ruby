# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/user_preferences_list_response"
require_relative "types/user_preferences_get_response"
require_relative "../../commons/types/preference_status"
require_relative "../../commons/types/channel_classification"
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
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesListResponse]
      def list(user_id:, request_options: nil)
        response = @request_client.conn.get("/users/#{user_id}/preferences") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Users::Preferences::UserPreferencesListResponse.from_json(json_object: response.body)
      end

      # Fetch user preferences for a specific subscription topic.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param topic_id [String] A unique identifier associated with a subscription topic.
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesGetResponse]
      def get(user_id:, topic_id:, request_options: nil)
        response = @request_client.conn.get("/users/#{user_id}/preferences/#{topic_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Users::Preferences::UserPreferencesGetResponse.from_json(json_object: response.body)
      end

      # Update or Create user preferences for a specific subscription topic.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param topic_id [String] A unique identifier associated with a subscription topic.
      # @param status [Commons::PreferenceStatus]
      # @param custom_routing [Array<Commons::ChannelClassification>] The Channels a user has chosen to receive notifications through for this topic
      # @param default_status [Commons::PreferenceStatus]
      # @param has_custom_routing [Boolean]
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesUpdateResponse]
      def update(user_id:, topic_id:, status:, default_status:, custom_routing: nil, has_custom_routing: nil,
                 request_options: nil)
        response = @request_client.conn.put("/users/#{user_id}/preferences/#{topic_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            status: status,
            custom_routing: custom_routing,
            default_status: default_status,
            has_custom_routing: has_custom_routing
          }.compact
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
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesListResponse]
      def list(user_id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/users/#{user_id}/preferences") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Users::Preferences::UserPreferencesListResponse.from_json(json_object: response.body)
        end
      end

      # Fetch user preferences for a specific subscription topic.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param topic_id [String] A unique identifier associated with a subscription topic.
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesGetResponse]
      def get(user_id:, topic_id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/users/#{user_id}/preferences/#{topic_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Users::Preferences::UserPreferencesGetResponse.from_json(json_object: response.body)
        end
      end

      # Update or Create user preferences for a specific subscription topic.
      #
      # @param user_id [String] A unique identifier associated with the user whose preferences you wish to retrieve.
      # @param topic_id [String] A unique identifier associated with a subscription topic.
      # @param status [Commons::PreferenceStatus]
      # @param custom_routing [Array<Commons::ChannelClassification>] The Channels a user has chosen to receive notifications through for this topic
      # @param default_status [Commons::PreferenceStatus]
      # @param has_custom_routing [Boolean]
      # @param request_options [RequestOptions]
      # @return [Users::Preferences::UserPreferencesUpdateResponse]
      def update(user_id:, topic_id:, status:, default_status:, custom_routing: nil, has_custom_routing: nil,
                 request_options: nil)
        Async do
          response = @request_client.conn.put("/users/#{user_id}/preferences/#{topic_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              status: status,
              custom_routing: custom_routing,
              default_status: default_status,
              has_custom_routing: has_custom_routing
            }.compact
          end
          Users::Preferences::UserPreferencesUpdateResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
