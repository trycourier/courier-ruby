# typed: strong

module Courier
  module Resources
    class Providers
      sig { returns(Courier::Resources::Providers::Catalog) }
      attr_reader :catalog

      # Create a new provider configuration. The `provider` field must be a known
      # Courier provider key (see catalog).
      sig do
        params(
          provider: String,
          alias_: String,
          settings: T::Hash[Symbol, T.anything],
          title: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Provider)
      end
      def create(
        # The provider key identifying the type (e.g. "sendgrid", "twilio"). Must be a
        # known Courier provider — see the catalog endpoint for valid keys.
        provider:,
        # Optional alias for this configuration.
        alias_: nil,
        # Provider-specific settings (snake_case keys). Defaults to an empty object when
        # omitted. Use the catalog endpoint to discover required fields for a given
        # provider — omitting a required field returns a 400 validation error.
        settings: nil,
        # Optional display title. Omit to use "Default Configuration".
        title: nil,
        request_options: {}
      )
      end

      # Fetch a single provider configuration by ID.
      sig do
        params(
          id: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Provider)
      end
      def retrieve(
        # A unique identifier of the provider configuration.
        id,
        request_options: {}
      )
      end

      # Update an existing provider configuration. The `provider` key is required. All
      # other fields are optional — omitted fields are cleared from the stored
      # configuration (this is a full replacement, not a partial merge).
      sig do
        params(
          id: String,
          provider: String,
          alias_: String,
          settings: T::Hash[Symbol, T.anything],
          title: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Provider)
      end
      def update(
        # A unique identifier of the provider configuration to update.
        id,
        # The provider key identifying the type.
        provider:,
        # Updated alias. Omit to clear.
        alias_: nil,
        # Provider-specific settings (snake_case keys). Replaces the full settings object
        # — omitted settings fields are removed. Use the catalog endpoint to check
        # required fields.
        settings: nil,
        # Updated display title.
        title: nil,
        request_options: {}
      )
      end

      # List configured provider integrations for the current workspace. Supports
      # cursor-based pagination.
      sig do
        params(
          cursor: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(Courier::Models::ProviderListResponse)
      end
      def list(
        # Opaque cursor for fetching the next page.
        cursor: nil,
        request_options: {}
      )
      end

      # Delete a provider configuration. Returns 409 if the provider is still referenced
      # by routing or notifications.
      sig do
        params(
          id: String,
          request_options: Courier::RequestOptions::OrHash
        ).void
      end
      def delete(
        # A unique identifier of the provider configuration to delete.
        id,
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
