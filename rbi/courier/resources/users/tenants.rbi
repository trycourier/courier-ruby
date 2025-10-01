# typed: strong

module Courier
  module Resources
    class Users
      class Tenants
        # Returns a paginated list of user tenant associations.
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

        # This endpoint is used to add a user to multiple tenants in one call. A custom
        # profile can also be supplied for each tenant. This profile will be merged with
        # the user's main profile when sending to the user with that tenant.
        sig do
          params(
            user_id: String,
            tenants: T::Array[Courier::Users::TenantAssociation::OrHash],
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

        # This endpoint is used to add a single tenant.
        #
        # A custom profile can also be supplied with the tenant. This profile will be
        # merged with the user's main profile when sending to the user with that tenant.
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
          # Body param:
          profile: nil,
          request_options: {}
        )
        end

        # Removes a user from any tenants they may have been associated with.
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

        # Removes a user from the supplied tenant.
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
