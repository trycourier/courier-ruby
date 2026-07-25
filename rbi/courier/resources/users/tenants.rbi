# typed: strong

module Courier
  module Resources
    class Users
      class Tenants
        # Returns the tenants a user belongs to, with cursor paging. A user can belong to
        # many tenants, each with its own profile and preferences.
        sig do
          params(
            user_id: String,
            cursor: T.nilable(String),
            limit: T.nilable(Integer),
            request_options: Courier::RequestOptions::OrHash
          ).returns(Courier::Models::Users::TenantListResponse)
        end
        def list(
          # Id of the user to retrieve all associated tenants for.
          user_id,
          # Continue the pagination with the next cursor
          cursor: nil,
          # The number of accounts to return (defaults to 20, maximum value of 100)
          limit: nil,
          request_options: {}
        )
        end

        # Adds a user to several tenants in one call, each optionally with a per-tenant
        # profile that overrides their workspace profile.
        sig do
          params(
            user_id: String,
            tenants: T::Array[Courier::TenantAssociation::OrHash],
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def add_multiple(
          # The user's ID. This can be any uniquely identifiable string.
          user_id,
          tenants:,
          request_options: {}
        )
        end

        # Adds a user to one tenant, optionally with a tenant-specific profile that
        # overrides their workspace profile for sends in that tenant.
        sig do
          params(
            tenant_id: String,
            user_id: String,
            profile: T.nilable(T::Hash[Symbol, T.anything]),
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def add_single(
          # Path param: Id of the tenant the user should be added to.
          tenant_id,
          # Path param: Id of the user to be added to the supplied tenant.
          user_id:,
          # Body param
          profile: nil,
          request_options: {}
        )
        end

        # Removes a user from every tenant they belong to in one call. Their
        # workspace-level profile is a separate resource.
        sig do
          params(
            user_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def remove_all(
          # Id of the user to be removed from the supplied tenant.
          user_id,
          request_options: {}
        )
        end

        # Removes a user from one tenant. Their other tenant memberships and workspace
        # profile are managed through separate endpoints.
        sig do
          params(
            tenant_id: String,
            user_id: String,
            request_options: Courier::RequestOptions::OrHash
          ).void
        end
        def remove_single(
          # Id of the tenant the user should be removed from.
          tenant_id,
          # Id of the user to be removed from the supplied tenant.
          user_id:,
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
end
