# frozen_string_literal: true

module Courier
  module Resources
    class Providers
      class Catalog
        # Some parameter documentations has been truncated, see
        # {Courier::Models::Providers::CatalogListParams} for more details.
        #
        # Returns the catalog of available provider types with their display names,
        # descriptions, and configuration schema fields (snake_case, with `type` and
        # `required`). Providers with no configurable schema return only `provider`,
        # `name`, and `description`.
        #
        # @overload list(channel: nil, keys: nil, name: nil, request_options: {})
        #
        # @param channel [String] Exact match (case-insensitive) against the provider channel taxonomy (e.g. `emai
        #
        # @param keys [String] Comma-separated provider keys to filter by (e.g. `sendgrid,twilio`).
        #
        # @param name [String] Case-insensitive substring match against the provider display name.
        #
        # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Courier::Models::Providers::CatalogListResponse]
        #
        # @see Courier::Models::Providers::CatalogListParams
        def list(params = {})
          parsed, options = Courier::Providers::CatalogListParams.dump_request(params)
          query = Courier::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "providers/catalog",
            query: query,
            model: Courier::Models::Providers::CatalogListResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [Courier::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
