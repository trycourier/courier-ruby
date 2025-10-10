# typed: strong

module Trycourier
  module Resources
    class Tenants
      sig { returns(Trycourier::Resources::Tenants::DefaultPreferences) }
      attr_reader :default_preferences

      sig { returns(Trycourier::Resources::Tenants::Templates) }
      attr_reader :templates

      # Get a Tenant
      sig do
        params(
          tenant_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Tenant)
      end
      def retrieve(
        # A unique identifier representing the tenant to be returned.
        tenant_id,
        request_options: {}
      )
      end

      # Create or Replace a Tenant
      sig do
        params(
          tenant_id: String,
          name: String,
          brand_id: T.nilable(String),
          default_preferences:
            T.nilable(Trycourier::DefaultPreferences::OrHash),
          parent_tenant_id: T.nilable(String),
          properties: T.nilable(T::Hash[Symbol, T.anything]),
          user_profile: T.nilable(T::Hash[Symbol, T.anything]),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Tenant)
      end
      def update(
        # A unique identifier representing the tenant to be returned.
        tenant_id,
        # Name of the tenant.
        name:,
        # Brand to be used for the account when one is not specified by the send call.
        brand_id: nil,
        # Defines the preferences used for the tenant when the user hasn't specified their
        # own.
        default_preferences: nil,
        # Tenant's parent id (if any).
        parent_tenant_id: nil,
        # Arbitrary properties accessible to a template.
        properties: nil,
        # A user profile object merged with user profile on send.
        user_profile: nil,
        request_options: {}
      )
      end

      # Get a List of Tenants
      sig do
        params(
          cursor: T.nilable(String),
          limit: T.nilable(Integer),
          parent_tenant_id: T.nilable(String),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::TenantListResponse)
      end
      def list(
        # Continue the pagination with the next cursor
        cursor: nil,
        # The number of tenants to return (defaults to 20, maximum value of 100)
        limit: nil,
        # Filter the list of tenants by parent_id
        parent_tenant_id: nil,
        request_options: {}
      )
      end

      # Delete a Tenant
      sig do
        params(
          tenant_id: String,
          request_options: Trycourier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Id of the tenant to be deleted.
        tenant_id,
        request_options: {}
      )
      end

      # Get Users in Tenant
      sig do
        params(
          tenant_id: String,
          cursor: T.nilable(String),
          limit: T.nilable(Integer),
          request_options: Trycourier::RequestOptions::OrHash
        ).returns(Trycourier::Models::TenantListUsersResponse)
      end
      def list_users(
        # Id of the tenant for user membership.
        tenant_id,
        # Continue the pagination with the next cursor
        cursor: nil,
        # The number of accounts to return (defaults to 20, maximum value of 100)
        limit: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Trycourier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
