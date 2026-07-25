# typed: strong

module Courier
  module Resources
    class Providers
      sig { returns(Courier::Resources::Providers::Catalog) }
      attr_reader :catalog

      # Configures a provider integration from a Courier provider key and its settings.
      # Check the catalog endpoint for the schema each provider expects.
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

      # Returns one configured provider by id, including its channel, provider key,
      # alias, title, and current settings.
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

      # Replaces a provider's configuration in full, clearing any field you omit rather
      # than merging it. Send the complete settings object.
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
        # The provider key identifying the type. Required on every request because it
        # selects the provider-specific settings schema for validation.
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

      # Lists the provider integrations configured in the workspace, one entry per
      # channel and provider key with its alias and settings.
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

      # Deletes a provider configuration, which fails while routing strategies or
      # templates still reference it. Update those references first.
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
