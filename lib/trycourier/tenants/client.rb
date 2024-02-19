# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/default_preferences"
require_relative "types/template_property"
require_relative "types/tenant"
require_relative "types/tenant_list_response"
require_relative "types/list_users_for_tenant_response"
require "async"

module Courier
  class TenantsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [TenantsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # @param tenant_id [String] A unique identifier representing the tenant to be returned.
    # @param name [String] Name of the tenant.
    # @param parent_tenant_id [String] Tenant's parent id (if any).
    # @param default_preferences [Hash] Defines the preferences used for the tenant when the user hasn't specified their own.Request of type Tenants::DefaultPreferences, as a Hash
    #   * :items (Array<Tenants::SubscriptionTopic>)
    # @param properties [Array<Tenants::TEMPLATE_PROPERTY>] Arbitrary properties accessible to a template.
    # @param user_profile [Hash{String => String}] A user profile object merged with user profile on send.
    # @param brand_id [String] Brand to be used for the account when one is not specified by the send call.
    # @param request_options [RequestOptions]
    # @return [Tenants::Tenant]
    def create_or_replace(tenant_id:, name:, parent_tenant_id: nil, default_preferences: nil, properties: nil,
                          user_profile: nil, brand_id: nil, request_options: nil)
      response = @request_client.conn.put("/tenants/#{tenant_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          name: name,
          parent_tenant_id: parent_tenant_id,
          default_preferences: default_preferences,
          properties: properties,
          user_profile: user_profile,
          brand_id: brand_id
        }.compact
      end
      Tenants::Tenant.from_json(json_object: response.body)
    end

    # @param tenant_id [String] A unique identifier representing the tenant to be returned.
    # @param request_options [RequestOptions]
    # @return [Tenants::Tenant]
    def get(tenant_id:, request_options: nil)
      response = @request_client.conn.get("/tenants/#{tenant_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
      Tenants::Tenant.from_json(json_object: response.body)
    end

    # @param limit [Integer] The number of accousnts to return
    #   (defaults to 20, maximum value of 100)
    # @param cursor [String] Continue the pagination with the next cursor
    # @param request_options [RequestOptions]
    # @return [Tenants::TenantListResponse]
    def list(limit: nil, cursor: nil, request_options: nil)
      response = @request_client.conn.get("/tenants") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "cursor": cursor
        }.compact
      end
      Tenants::TenantListResponse.from_json(json_object: response.body)
    end

    # @param tenant_id [String] Id of the tenant to be deleted.
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(tenant_id:, request_options: nil)
      @request_client.conn.delete("/tenants/#{tenant_id}") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
      end
    end

    # @param tenant_id [String] Id of the tenant for user membership.
    # @param limit [Integer] The number of accounts to return
    #   (defaults to 20, maximum value of 100)
    # @param cursor [String] Continue the pagination with the next cursor
    # @param request_options [RequestOptions]
    # @return [Tenants::ListUsersForTenantResponse]
    def get_users_by_tenant(tenant_id:, limit: nil, cursor: nil, request_options: nil)
      response = @request_client.conn.get("/tenants/#{tenant_id}/users") do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        unless request_options&.authorization_token.nil?
          req.headers["Authorization"] =
            request_options.authorization_token
        end
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "cursor": cursor
        }.compact
      end
      Tenants::ListUsersForTenantResponse.from_json(json_object: response.body)
    end
  end

  class AsyncTenantsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncTenantsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # @param tenant_id [String] A unique identifier representing the tenant to be returned.
    # @param name [String] Name of the tenant.
    # @param parent_tenant_id [String] Tenant's parent id (if any).
    # @param default_preferences [Hash] Defines the preferences used for the tenant when the user hasn't specified their own.Request of type Tenants::DefaultPreferences, as a Hash
    #   * :items (Array<Tenants::SubscriptionTopic>)
    # @param properties [Array<Tenants::TEMPLATE_PROPERTY>] Arbitrary properties accessible to a template.
    # @param user_profile [Hash{String => String}] A user profile object merged with user profile on send.
    # @param brand_id [String] Brand to be used for the account when one is not specified by the send call.
    # @param request_options [RequestOptions]
    # @return [Tenants::Tenant]
    def create_or_replace(tenant_id:, name:, parent_tenant_id: nil, default_preferences: nil, properties: nil,
                          user_profile: nil, brand_id: nil, request_options: nil)
      Async do
        response = @request_client.conn.put("/tenants/#{tenant_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            name: name,
            parent_tenant_id: parent_tenant_id,
            default_preferences: default_preferences,
            properties: properties,
            user_profile: user_profile,
            brand_id: brand_id
          }.compact
        end
        Tenants::Tenant.from_json(json_object: response.body)
      end
    end

    # @param tenant_id [String] A unique identifier representing the tenant to be returned.
    # @param request_options [RequestOptions]
    # @return [Tenants::Tenant]
    def get(tenant_id:, request_options: nil)
      Async do
        response = @request_client.conn.get("/tenants/#{tenant_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Tenants::Tenant.from_json(json_object: response.body)
      end
    end

    # @param limit [Integer] The number of accousnts to return
    #   (defaults to 20, maximum value of 100)
    # @param cursor [String] Continue the pagination with the next cursor
    # @param request_options [RequestOptions]
    # @return [Tenants::TenantListResponse]
    def list(limit: nil, cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/tenants") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "limit": limit,
            "cursor": cursor
          }.compact
        end
        Tenants::TenantListResponse.from_json(json_object: response.body)
      end
    end

    # @param tenant_id [String] Id of the tenant to be deleted.
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete(tenant_id:, request_options: nil)
      Async do
        @request_client.conn.delete("/tenants/#{tenant_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end

    # @param tenant_id [String] Id of the tenant for user membership.
    # @param limit [Integer] The number of accounts to return
    #   (defaults to 20, maximum value of 100)
    # @param cursor [String] Continue the pagination with the next cursor
    # @param request_options [RequestOptions]
    # @return [Tenants::ListUsersForTenantResponse]
    def get_users_by_tenant(tenant_id:, limit: nil, cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get("/tenants/#{tenant_id}/users") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "limit": limit,
            "cursor": cursor
          }.compact
        end
        Tenants::ListUsersForTenantResponse.from_json(json_object: response.body)
      end
    end
  end
end
