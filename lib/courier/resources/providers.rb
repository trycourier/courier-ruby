# frozen_string_literal: true

module Courier
  module Resources
    class Providers
      # @return [Courier::Resources::Providers::Catalog]
      attr_reader :catalog

      # Some parameter documentations has been truncated, see
      # {Courier::Models::ProviderCreateParams} for more details.
      #
      # Configures a provider integration from a Courier provider key and its settings.
      # Check the catalog endpoint for the schema each provider expects.
      #
      # @overload create(provider:, alias_: nil, settings: nil, title: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
      #
      # @param provider [String] Body param: The provider key identifying the type (e.g. "sendgrid", "twilio"). M
      #
      # @param alias_ [String] Body param: Optional alias for this configuration.
      #
      # @param settings [Hash{Symbol=>Object}] Body param: Provider-specific settings (snake_case keys). Defaults to an empty o
      #
      # @param title [String] Body param: Optional display title. Omit to use "Default Configuration".
      #
      # @param idempotency_key [String] Header param: A unique key that makes this request idempotent. If Courier receiv
      #
      # @param x_idempotency_expiration [String] Header param: How long the idempotency key remains valid, as a Unix epoch timest
      #
      # @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Courier::Models::Provider]
      #
      # @see Courier::Models::ProviderCreateParams
      def create(params)
        parsed, options = Courier::ProviderCreateParams.dump_request(params)
        header_params =
          {idempotency_key: "idempotency-key", x_idempotency_expiration: "x-idempotency-expiration"}
        @client.request(
          method: :post,
          path: "providers",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Courier::Provider,
          options: options
        )
      end

      # Returns one configured provider by id, including its channel, provider key,
      # alias, title, and current settings.
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
      # Replaces a provider's configuration in full, clearing any field you omit rather
      # than merging it. Send the complete settings object.
      #
      # @overload update(id, provider:, alias_: nil, settings: nil, title: nil, request_options: {})
      #
      # @param id [String] A unique identifier of the provider configuration to update.
      #
      # @param provider [String] The provider key identifying the type. Required on every request because it sele
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
          method: :put,
          path: ["providers/%1$s", id],
          body: parsed,
          model: Courier::Provider,
          options: options
        )
      end

      # Lists the provider integrations configured in the workspace, one entry per
      # channel and provider key with its alias and settings.
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

      # Deletes a provider configuration, which fails while routing strategies or
      # templates still reference it. Update those references first.
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
