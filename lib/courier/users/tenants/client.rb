# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/user_tenant_association"
require_relative "types/list_tenants_for_user_response"
require "async"

module Courier
  module Users
    class TenantsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Users::TenantsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # This endpoint is used to add a user to
      # multiple tenants in one call.
      # A custom profile can also be supplied for each tenant.
      # This profile will be merged with the user's main
      # profile when sending to the user with that tenant.
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param tenants [Array<Hash>] Request of type Array<Commons::UserTenantAssociation>, as a Hash
      #   * :user_id (String)
      #   * :type (String)
      #   * :tenant_id (String)
      #   * :profile (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Void]
      def add_multple(user_id:, tenants:, request_options: nil)
        @request_client.conn.put("/users/#{user_id}/tenants") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), tenants: tenants }.compact
        end
      end

      # This endpoint is used to add a single tenant.
      #
      # A custom profile can also be supplied with the tenant.
      # This profile will be merged with the user's main profile
      # when sending to the user with that tenant.
      #
      # @param user_id [String] Id of the user to be added to the supplied tenant.
      # @param tenant_id [String] Id of the tenant the user should be added to.
      # @param profile [Hash{String => String}]
      # @param request_options [RequestOptions]
      # @return [Void]
      def add(user_id:, tenant_id:, profile: nil, request_options: nil)
        @request_client.conn.put("/users/#{user_id}/tenants/#{tenant_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), profile: profile }.compact
        end
      end

      # Removes a user from any tenants they may have been associated with.
      #
      # @param user_id [String] Id of the user to be removed from the supplied tenant.
      # @param request_options [RequestOptions]
      # @return [Void]
      def remove_all(user_id:, request_options: nil)
        @request_client.conn.delete("/users/#{user_id}/tenants") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end

      # Removes a user from the supplied tenant.
      #
      # @param user_id [String] Id of the user to be removed from the supplied tenant.
      # @param tenant_id [String] Id of the tenant the user should be removed from.
      # @param request_options [RequestOptions]
      # @return [Void]
      def remove(user_id:, tenant_id:, request_options: nil)
        @request_client.conn.delete("/users/#{user_id}/tenants/#{tenant_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          unless request_options&.authorization_token.nil?
            req.headers["Authorization"] =
              request_options.authorization_token
          end
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end

      # Returns a paginated list of user tenant associations.
      #
      # @param user_id [String] Id of the user to retrieve all associated tenants for.
      # @param limit [Integer] The number of accounts to return
      #   (defaults to 20, maximum value of 100)
      # @param cursor [String] Continue the pagination with the next cursor
      # @param request_options [RequestOptions]
      # @return [Users::Tenants::ListTenantsForUserResponse]
      def list(user_id:, limit: nil, cursor: nil, request_options: nil)
        response = @request_client.conn.get("/users/#{user_id}/tenants") do |req|
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
        Users::Tenants::ListTenantsForUserResponse.from_json(json_object: response.body)
      end
    end

    class AsyncTenantsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Users::AsyncTenantsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # This endpoint is used to add a user to
      # multiple tenants in one call.
      # A custom profile can also be supplied for each tenant.
      # This profile will be merged with the user's main
      # profile when sending to the user with that tenant.
      #
      # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
      # @param tenants [Array<Hash>] Request of type Array<Commons::UserTenantAssociation>, as a Hash
      #   * :user_id (String)
      #   * :type (String)
      #   * :tenant_id (String)
      #   * :profile (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Void]
      def add_multple(user_id:, tenants:, request_options: nil)
        Async do
          @request_client.conn.put("/users/#{user_id}/tenants") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), tenants: tenants }.compact
          end
        end
      end

      # This endpoint is used to add a single tenant.
      #
      # A custom profile can also be supplied with the tenant.
      # This profile will be merged with the user's main profile
      # when sending to the user with that tenant.
      #
      # @param user_id [String] Id of the user to be added to the supplied tenant.
      # @param tenant_id [String] Id of the tenant the user should be added to.
      # @param profile [Hash{String => String}]
      # @param request_options [RequestOptions]
      # @return [Void]
      def add(user_id:, tenant_id:, profile: nil, request_options: nil)
        Async do
          @request_client.conn.put("/users/#{user_id}/tenants/#{tenant_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), profile: profile }.compact
          end
        end
      end

      # Removes a user from any tenants they may have been associated with.
      #
      # @param user_id [String] Id of the user to be removed from the supplied tenant.
      # @param request_options [RequestOptions]
      # @return [Void]
      def remove_all(user_id:, request_options: nil)
        Async do
          @request_client.conn.delete("/users/#{user_id}/tenants") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end
      end

      # Removes a user from the supplied tenant.
      #
      # @param user_id [String] Id of the user to be removed from the supplied tenant.
      # @param tenant_id [String] Id of the tenant the user should be removed from.
      # @param request_options [RequestOptions]
      # @return [Void]
      def remove(user_id:, tenant_id:, request_options: nil)
        Async do
          @request_client.conn.delete("/users/#{user_id}/tenants/#{tenant_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            unless request_options&.authorization_token.nil?
              req.headers["Authorization"] =
                request_options.authorization_token
            end
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end
      end

      # Returns a paginated list of user tenant associations.
      #
      # @param user_id [String] Id of the user to retrieve all associated tenants for.
      # @param limit [Integer] The number of accounts to return
      #   (defaults to 20, maximum value of 100)
      # @param cursor [String] Continue the pagination with the next cursor
      # @param request_options [RequestOptions]
      # @return [Users::Tenants::ListTenantsForUserResponse]
      def list(user_id:, limit: nil, cursor: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/users/#{user_id}/tenants") do |req|
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
          Users::Tenants::ListTenantsForUserResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
