# frozen_string_literal: true

module Trycourier
  module Resources
    class Tenants
      # @return [Trycourier::Resources::Tenants::Preferences]
      attr_reader :preferences

      # @return [Trycourier::Resources::Tenants::Templates]
      attr_reader :templates

      # Get a Tenant
      #
      # @overload retrieve(tenant_id, request_options: {})
      #
      # @param tenant_id [String] A unique identifier representing the tenant to be returned.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::Tenant]
      #
      # @see Trycourier::Models::TenantRetrieveParams
      def retrieve(tenant_id, params = {})
        @client.request(
          method: :get,
          path: ["tenants/%1$s", tenant_id],
          model: Trycourier::Tenant,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::TenantUpdateParams} for more details.
      #
      # Create or Replace a Tenant
      #
      # @overload update(tenant_id, name:, brand_id: nil, default_preferences: nil, parent_tenant_id: nil, properties: nil, user_profile: nil, request_options: {})
      #
      # @param tenant_id [String] A unique identifier representing the tenant to be returned.
      #
      # @param name [String] Name of the tenant.
      #
      # @param brand_id [String, nil] Brand to be used for the account when one is not specified by the send call.
      #
      # @param default_preferences [Trycourier::Models::DefaultPreferences, nil] Defines the preferences used for the tenant when the user hasn't specified their
      #
      # @param parent_tenant_id [String, nil] Tenant's parent id (if any).
      #
      # @param properties [Hash{Symbol=>Object}, nil] Arbitrary properties accessible to a template.
      #
      # @param user_profile [Hash{Symbol=>Object}, nil] A user profile object merged with user profile on send.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::Tenant]
      #
      # @see Trycourier::Models::TenantUpdateParams
      def update(tenant_id, params)
        parsed, options = Trycourier::TenantUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["tenants/%1$s", tenant_id],
          body: parsed,
          model: Trycourier::Tenant,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::TenantListParams} for more details.
      #
      # Get a List of Tenants
      #
      # @overload list(cursor: nil, limit: nil, parent_tenant_id: nil, request_options: {})
      #
      # @param cursor [String, nil] Continue the pagination with the next cursor
      #
      # @param limit [Integer, nil] The number of tenants to return
      #
      # @param parent_tenant_id [String, nil] Filter the list of tenants by parent_id
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::TenantListResponse]
      #
      # @see Trycourier::Models::TenantListParams
      def list(params = {})
        parsed, options = Trycourier::TenantListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "tenants",
          query: parsed,
          model: Trycourier::Models::TenantListResponse,
          options: options
        )
      end

      # Delete a Tenant
      #
      # @overload delete(tenant_id, request_options: {})
      #
      # @param tenant_id [String] Id of the tenant to be deleted.
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Trycourier::Models::TenantDeleteParams
      def delete(tenant_id, params = {})
        @client.request(
          method: :delete,
          path: ["tenants/%1$s", tenant_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Trycourier::Models::TenantListUsersParams} for more details.
      #
      # Get Users in Tenant
      #
      # @overload list_users(tenant_id, cursor: nil, limit: nil, request_options: {})
      #
      # @param tenant_id [String] Id of the tenant for user membership.
      #
      # @param cursor [String, nil] Continue the pagination with the next cursor
      #
      # @param limit [Integer, nil] The number of accounts to return
      #
      # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Trycourier::Models::TenantListUsersResponse]
      #
      # @see Trycourier::Models::TenantListUsersParams
      def list_users(tenant_id, params = {})
        parsed, options = Trycourier::TenantListUsersParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["tenants/%1$s/users", tenant_id],
          query: parsed,
          model: Trycourier::Models::TenantListUsersResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Trycourier::Client]
      def initialize(client:)
        @client = client
        @preferences = Trycourier::Resources::Tenants::Preferences.new(client: client)
        @templates = Trycourier::Resources::Tenants::Templates.new(client: client)
      end
    end
  end
end
