# frozen_string_literal: true

module Courier
  module Resources
    class Tenants
      # @return [Courier::Resources::Tenants::Preferences]
      attr_reader :preferences

      # @return [Courier::Resources::Tenants::Templates]
      attr_reader :templates

      # Returns one tenant with its name, parent tenant id, default preferences,
      # properties, and the user profile applied to its members.
      #
      # @overload retrieve(tenant_id, request_options: {})
      #
      # @param tenant_id [String] A unique identifier representing the tenant to be returned.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Tenant]
      #
      # @see Courier::Models::TenantRetrieveParams
      def retrieve(tenant_id, params = {})
        @client.request(
          method: :get,
          path: ["tenants/%1$s", tenant_id],
          model: Courier::Tenant,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::TenantUpdateParams} for more details.
      #
      # Creates or replaces a tenant from a name, parent, brand, properties, and default
      # preferences supplied in the request body.
      #
      # @overload update(tenant_id, name:, brand_id: nil, default_preferences: nil, parent_tenant_id: nil, properties: nil, user_profile: nil, request_options: {})
      #
      # @param tenant_id [String] A unique identifier representing the tenant to be returned.
      #
      # @param name [String] Name of the tenant.
      #
      # @param brand_id [String, nil] Brand to be used for the account when one is not specified by the send call.
      #
      # @param default_preferences [Courier::Models::DefaultPreferences, nil] Defines the preferences used for the tenant when the user hasn't specified their
      #
      # @param parent_tenant_id [String, nil] Tenant's parent id (if any).
      #
      # @param properties [Hash{Symbol=>Object}, nil] Arbitrary properties accessible to a template.
      #
      # @param user_profile [Hash{Symbol=>Object}, nil] A user profile object merged with user profile on send.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Tenant]
      #
      # @see Courier::Models::TenantUpdateParams
      def update(tenant_id, params)
        parsed, options = Courier::TenantUpdateParams.dump_request(params)
        @client.request(
          method: :put,
          path: ["tenants/%1$s", tenant_id],
          body: parsed,
          model: Courier::Tenant,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::TenantListParams} for more details.
      #
      # Lists the workspace's tenants, each carrying a name, parent tenant, properties,
      # and default preferences. Paged.
      #
      # @overload list(cursor: nil, limit: nil, parent_tenant_id: nil, request_options: {})
      #
      # @param cursor [String, nil] Continue the pagination with the next cursor
      #
      # @param limit [Integer, nil] The number of tenants to return
      #
      # @param parent_tenant_id [String, nil] Filter the list of tenants by parent_id
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::TenantListResponse]
      #
      # @see Courier::Models::TenantListParams
      def list(params = {})
        parsed, options = Courier::TenantListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "tenants",
          query: query,
          model: Courier::Models::TenantListResponse,
          options: options
        )
      end

      # Deletes a tenant. Its members' workspace-level profiles and preferences live
      # outside the tenant and are managed separately.
      #
      # @overload delete(tenant_id, request_options: {})
      #
      # @param tenant_id [String] Id of the tenant to be deleted.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::TenantDeleteParams
      def delete(tenant_id, params = {})
        @client.request(
          method: :delete,
          path: ["tenants/%1$s", tenant_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::TenantListUsersParams} for more details.
      #
      # Returns the users belonging to a tenant with cursor paging. Use it to see who a
      # tenant-scoped send will reach.
      #
      # @overload list_users(tenant_id, cursor: nil, limit: nil, request_options: {})
      #
      # @param tenant_id [String] Id of the tenant for user membership.
      #
      # @param cursor [String, nil] Continue the pagination with the next cursor
      #
      # @param limit [Integer, nil] The number of accounts to return
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::TenantListUsersResponse]
      #
      # @see Courier::Models::TenantListUsersParams
      def list_users(tenant_id, params = {})
        parsed, options = Courier::TenantListUsersParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["tenants/%1$s/users", tenant_id],
          query: query,
          model: Courier::Models::TenantListUsersResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @preferences = Courier::Resources::Tenants::Preferences.new(client: client)
        @templates = Courier::Resources::Tenants::Templates.new(client: client)
      end
    end
  end
end
