# typed: strong

module Courier
  module Models
    class Provider < Courier::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Courier::Provider, Courier::Internal::AnyHash) }

      # A unique identifier for the provider configuration.
      sig { returns(String) }
      attr_accessor :id

      # Unix timestamp (ms) of when the provider was created.
      sig { returns(Integer) }
      attr_accessor :created

      # The provider key (e.g. "sendgrid", "twilio", "slack").
      sig { returns(String) }
      attr_accessor :provider

      # Provider-specific settings (snake_case keys on the wire).
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :settings

      # Display title. Defaults to "Default Configuration" when not explicitly set.
      sig { returns(String) }
      attr_accessor :title

      # Optional alias for this configuration.
      sig { returns(T.nilable(String)) }
      attr_reader :alias_

      sig { params(alias_: String).void }
      attr_writer :alias_

      # Unix timestamp (ms) of when the provider was last updated.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :updated

      # A configured provider in the workspace.
      sig do
        params(
          id: String,
          created: Integer,
          provider: String,
          settings: T::Hash[Symbol, T.anything],
          title: String,
          alias_: String,
          updated: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier for the provider configuration.
        id:,
        # Unix timestamp (ms) of when the provider was created.
        created:,
        # The provider key (e.g. "sendgrid", "twilio", "slack").
        provider:,
        # Provider-specific settings (snake_case keys on the wire).
        settings:,
        # Display title. Defaults to "Default Configuration" when not explicitly set.
        title:,
        # Optional alias for this configuration.
        alias_: nil,
        # Unix timestamp (ms) of when the provider was last updated.
        updated: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created: Integer,
            provider: String,
            settings: T::Hash[Symbol, T.anything],
            title: String,
            alias_: String,
            updated: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
