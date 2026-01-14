# frozen_string_literal: true

module Trycourier
  module Resources
    class Users
      class Tenants
        # Some parameter documentations has been truncated, see
        # {Trycourier::Models::Users::TenantListParams} for more details.
        #
        # Returns a paginated list of user tenant associations.
        #
        # @overload list(user_id, cursor: nil, limit: nil, request_options: {})
        #
        # @param user_id [String] Id of the user to retrieve all associated tenants for.
        #
        # @param cursor [String, nil] Continue the pagination with the next cursor
        #
        # @param limit [Integer, nil] The number of accounts to return
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Trycourier::Models::Users::TenantListResponse]
        #
        # @see Trycourier::Models::Users::TenantListParams
        def list(user_id, params = {})
          parsed, options = Trycourier::Users::TenantListParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["users/%1$s/tenants", user_id],
            query: parsed,
            model: Trycourier::Models::Users::TenantListResponse,
            options: options
          )
        end

        # This endpoint is used to add a user to multiple tenants in one call. A custom
        # profile can also be supplied for each tenant. This profile will be merged with
        # the user's main profile when sending to the user with that tenant.
        #
        # @overload add_multiple(user_id, tenants:, request_options: {})
        #
        # @param user_id [String] The user's ID. This can be any uniquely identifiable string.
        #
        # @param tenants [Array<Trycourier::Models::TenantAssociation>]
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Trycourier::Models::Users::TenantAddMultipleParams
        def add_multiple(user_id, params)
          parsed, options = Trycourier::Users::TenantAddMultipleParams.dump_request(params)
          @client.request(
            method: :put,
            path: ["users/%1$s/tenants", user_id],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # This endpoint is used to add a single tenant.
        #
        # A custom profile can also be supplied with the tenant. This profile will be
        # merged with the user's main profile when sending to the user with that tenant.
        #
        # @overload add_single(tenant_id, user_id:, profile: nil, request_options: {})
        #
        # @param tenant_id [String] Path param: Id of the tenant the user should be added to.
        #
        # @param user_id [String] Path param: Id of the user to be added to the supplied tenant.
        #
        # @param profile [Hash{Symbol=>Object}, nil] Body param
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Trycourier::Models::Users::TenantAddSingleParams
        def add_single(tenant_id, params)
          parsed, options = Trycourier::Users::TenantAddSingleParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :put,
            path: ["users/%1$s/tenants/%2$s", user_id, tenant_id],
            body: parsed,
            model: NilClass,
            options: options
          )
        end

        # Removes a user from any tenants they may have been associated with.
        #
        # @overload remove_all(user_id, request_options: {})
        #
        # @param user_id [String] Id of the user to be removed from the supplied tenant.
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Trycourier::Models::Users::TenantRemoveAllParams
        def remove_all(user_id, params = {})
          @client.request(
            method: :delete,
            path: ["users/%1$s/tenants", user_id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Removes a user from the supplied tenant.
        #
        # @overload remove_single(tenant_id, user_id:, request_options: {})
        #
        # @param tenant_id [String] Id of the tenant the user should be removed from.
        #
        # @param user_id [String] Id of the user to be removed from the supplied tenant.
        #
        # @param request_options [Trycourier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Trycourier::Models::Users::TenantRemoveSingleParams
        def remove_single(tenant_id, params)
          parsed, options = Trycourier::Users::TenantRemoveSingleParams.dump_request(params)
          user_id =
            parsed.delete(:user_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["users/%1$s/tenants/%2$s", user_id, tenant_id],
            model: NilClass,
            options: options
          )
        end

        # @api private
        #
        # @param client [Trycourier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
