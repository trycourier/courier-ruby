# frozen_string_literal: true

module Courier
  module Resources
    class Providers
      # @return [Courier::Resources::Providers::Catalog]
      attr_reader :catalog

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProviderCreateParams} for more details.
      #
      # Create a new provider configuration. The `provider` field must be a known
      # Courier provider key (see catalog).
      #
      # @overload create(provider:, alias_: nil, settings: nil, title: nil, request_options: {})
      #
      # @param provider [String] The provider key identifying the type (e.g. "sendgrid", "twilio"). Must be a kno
      #
      # @param alias_ [String] Optional alias for this configuration.
      #
      # @param settings [Hash{Symbol=>Object}] Provider-specific settings (snake_case keys). Defaults to an empty object when o
      #
      # @param title [String] Optional display title. Omit to use "Default Configuration".
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Provider]
      #
      # @see Courier::Models::ProviderCreateParams
      def create(params)
        parsed, options = Courier::ProviderCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "providers",
          body: parsed,
          model: Courier::Provider,
          options: options
        )
      end

      # Fetch a single provider configuration by ID.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] A unique identifier of the provider configuration.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Provider]
      #
      # @see Courier::Models::ProviderRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["providers/%1$s", id],
          model: Courier::Provider,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProviderUpdateParams} for more details.
      #
      # Update an existing provider configuration. The `provider` key is required. All
      # other fields are optional — omitted fields are cleared from the stored
      # configuration (this is a full replacement, not a partial merge).
      #
      # @overload update(id, provider:, alias_: nil, settings: nil, title: nil, request_options: {})
      #
      # @param id [String] A unique identifier of the provider configuration to update.
      #
      # @param provider [String] The provider key identifying the type.
      #
      # @param alias_ [String] Updated alias. Omit to clear.
      #
      # @param settings [Hash{Symbol=>Object}] Provider-specific settings (snake_case keys). Replaces the full settings object
      #
      # @param title [String] Updated display title.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Provider]
      #
      # @see Courier::Models::ProviderUpdateParams
      def update(id, params)
        parsed, options = Courier::ProviderUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["providers/%1$s", id],
          body: parsed,
          model: Courier::Provider,
          options: options
        )
      end

      # List configured provider integrations for the current workspace. Supports
      # cursor-based pagination.
      #
      # @overload list(cursor: nil, request_options: {})
      #
      # @param cursor [String] Opaque cursor for fetching the next page.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::ProviderListResponse]
      #
      # @see Courier::Models::ProviderListParams
      def list(params = {})
        parsed, options = Courier::ProviderListParams.dump_request(params)
        query = Courier::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "providers",
          query: query,
          model: Courier::Models::ProviderListResponse,
          options: options
        )
      end

      # Delete a provider configuration. Returns 409 if the provider is still referenced
      # by routing or notifications.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] A unique identifier of the provider configuration to delete.
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Courier::Models::ProviderDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["providers/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Courier::Client]
      def initialize(client:)
        @client = client
        @catalog = Courier::Resources::Providers::Catalog.new(client: client)
      end
    end
  end
end
