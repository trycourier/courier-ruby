# typed: strong

module Courier
  module Models
    class ProviderPatchParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Courier::ProviderPatchParams, Courier::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Updated alias. Set to null to clear it.
      sig { returns(T.nilable(String)) }
      attr_accessor :alias_

      # The provider key identifying the type. Optional. When sent, it must match the
      # stored provider, otherwise the request returns a 400.
      sig { returns(T.nilable(String)) }
      attr_reader :provider

      sig { params(provider: String).void }
      attr_writer :provider

      # Provider-specific settings (snake_case keys) to merge into the stored settings,
      # using JSON Merge Patch (RFC 7396). Each key you send replaces the stored value,
      # a key set to null is removed, nested objects merge recursively, and arrays
      # replace the stored value. Keys you omit keep their stored values. Set
      # `rate_limit` to null to remove this configuration's send rate limit.
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
          alias_: T.nilable(String),
          provider: String,
          settings: T::Hash[Symbol, T.anything],
          title: String,
          request_options: Courier::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Updated alias. Set to null to clear it.
        alias_: nil,
        # The provider key identifying the type. Optional. When sent, it must match the
        # stored provider, otherwise the request returns a 400.
        provider: nil,
        # Provider-specific settings (snake_case keys) to merge into the stored settings,
        # using JSON Merge Patch (RFC 7396). Each key you send replaces the stored value,
        # a key set to null is removed, nested objects merge recursively, and arrays
        # replace the stored value. Keys you omit keep their stored values. Set
        # `rate_limit` to null to remove this configuration's send rate limit.
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
            alias_: T.nilable(String),
            provider: String,
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
