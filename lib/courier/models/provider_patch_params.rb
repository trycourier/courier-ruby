# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Providers#patch
    class ProviderPatchParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute alias_
      #   Updated alias. Set to null to clear it.
      #
      #   @return [String, nil]
      optional :alias_, String, api_name: :alias, nil?: true

      # @!attribute provider
      #   The provider key identifying the type. Optional. When sent, it must match the
      #   stored provider, otherwise the request returns a 400.
      #
      #   @return [String, nil]
      optional :provider, String

      # @!attribute settings
      #   Provider-specific settings (snake_case keys) to merge into the stored settings,
      #   using JSON Merge Patch (RFC 7396). Each key you send replaces the stored value,
      #   a key set to null is removed, nested objects merge recursively, and arrays
      #   replace the stored value. Keys you omit keep their stored values. Set
      #   `rate_limit` to null to remove this configuration's send rate limit.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :settings, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute title
      #   Updated display title.
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(id:, alias_: nil, provider: nil, settings: nil, title: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ProviderPatchParams} for more details.
      #
      #   @param id [String]
      #
      #   @param alias_ [String, nil] Updated alias. Set to null to clear it.
      #
      #   @param provider [String] The provider key identifying the type. Optional. When sent, it must match the st
      #
      #   @param settings [Hash{Symbol=>Object}] Provider-specific settings (snake_case keys) to merge into the stored settings,
      #
      #   @param title [String] Updated display title.
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
