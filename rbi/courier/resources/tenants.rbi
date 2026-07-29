# typed: strong

module Courier
  module Resources
    # Manage tenants — the organizations, teams, or accounts your users belong to —
    # along with their users and default preferences.
    class Tenants
      sig { returns(Courier::Resources::Tenants::Preferences) }
      attr_reader :preferences

      # Manage the templates and template versions scoped to a single tenant, including
      # the ones authored in the embedded designer.
      sig { returns(Courier::Resources::Tenants::Templates) }
      attr_reader :templates

      # Returns one tenant with its name, parent tenant id, default preferences,
      # properties, and the user profile applied to its members.
      sig do
        params(
          tenant_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Tenant)
      end
      def retrieve(
        # A unique identifier representing the tenant to be returned.
        tenant_id,
        request_options: {}
      )
      end

      # Creates or replaces a tenant from a name, parent, brand, properties, and default
      # preferences supplied in the request body.
      sig do
        params(
          tenant_id: String,
          name: String,
          brand_id: T.nilable(String),
          default_preferences: T.nilable(Courier::DefaultPreferences::OrHash),
          parent_tenant_id: T.nilable(String),
          properties: T.nilable(T::Hash[Symbol, T.anything]),
          user_profile: T.nilable(T::Hash[Symbol, T.anything]),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Tenant)
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

      # Lists the workspace's tenants, each carrying a name, parent tenant, properties,
      # and default preferences. Paged.
      sig do
        params(
          cursor: T.nilable(String),
          limit: T.nilable(Integer),
          parent_tenant_id: T.nilable(String),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::TenantListResponse)
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

      # Deletes a tenant. Its members' workspace-level profiles and preferences live
      # outside the tenant and are managed separately.
      sig do
        params(
          tenant_id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Id of the tenant to be deleted.
        tenant_id,
        request_options: {}
      )
      end

      # Returns the users belonging to a tenant with cursor paging. Use it to see who a
      # tenant-scoped send will reach.
      sig do
        params(
          tenant_id: String,
          cursor: T.nilable(String),
          limit: T.nilable(Integer),
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::TenantListUsersResponse)
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
      sig { params(client: Courier::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
