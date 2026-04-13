# typed: strong

module Courier
  module Models
    class ProviderUpdateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::ProviderUpdateParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # The provider key identifying the type. Required on every request because it
      # selects the provider-specific settings schema for validation.
      sig { returns(String) }
      attr_accessor :provider

      # Updated alias. Omit to clear.
      sig { returns(T.nilable(String)) }
      attr_reader :alias_

      sig { params(alias_: String).void }
      attr_writer :alias_

      # Provider-specific settings (snake_case keys). Replaces the full settings object
      # — omitted settings fields are removed. Use the catalog endpoint to check
      # required fields.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :settings

      sig { params(settings: T::Hash[Symbol, T.anything]).void }
      attr_writer :settings

      # Updated display title.
      sig { returns(T.nilable(String)) }
      attr_reader :title

      sig { params(title: String).void }
      attr_writer :title

      sig do
        params(
          id: String,
          provider: String,
          alias_: String,
          settings: T::Hash[Symbol, T.anything],
          title: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
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

      sig do
        override.returns(
          {
            id: String,
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
