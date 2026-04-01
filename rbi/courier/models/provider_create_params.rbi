# typed: strong

module Courier
  module Models
    class ProviderCreateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::ProviderCreateParams, Courier::Internal::AnyHash)
        end

      # The provider key identifying the type (e.g. "sendgrid", "twilio"). Must be a
      # known Courier provider — see the catalog endpoint for valid keys.
      sig { returns(String) }
      attr_accessor :provider

      # Optional alias for this configuration.
      sig { returns(T.nilable(String)) }
      attr_reader :alias_

      sig { params(alias_: String).void }
      attr_writer :alias_

      # Provider-specific settings (snake_case keys). Defaults to an empty object when
      # omitted. Use the catalog endpoint to discover required fields for a given
      # provider — omitting a required field returns a 400 validation error.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :settings

      sig { params(settings: T::Hash[Symbol, T.anything]).void }
      attr_writer :settings

      # Optional display title. Omit to use "Default Configuration".
      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      sig do
        params(
          provider: String,
          alias_: String,
          settings: T::Hash[Symbol, T.anything],
          title: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            provider: String,
            alias_: String,
            settings: T::Hash[Symbol, T.anything],
            title: String,
            request_options: Courier::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
