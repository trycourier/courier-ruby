# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Providers#create
    class ProviderCreateParams < Courier::Internal::Type::BaseModel
      extend Courier::Internal::Type::RequestParameters::Converter
      include Courier::Internal::Type::RequestParameters

      # @!attribute provider
      #   The provider key identifying the type (e.g. "sendgrid", "twilio"). Must be a
      #   known Courier provider — see the catalog endpoint for valid keys.
      #
      #   @return [String]
      required :provider, String

      # @!attribute alias_
      #   Optional alias for this configuration.
      #
      #   @return [String, nil]
      optional :alias_, String, api_name: :alias

      # @!attribute settings
      #   Provider-specific settings (snake_case keys). Defaults to an empty object when
      #   omitted. Use the catalog endpoint to discover required fields for a given
      #   provider — omitting a required field returns a 400 validation error.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :settings, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute title
      #   Optional display title. Omit to use "Default Configuration".
      #
      #   @return [String, nil]
      optional :title, String

      # @!method initialize(provider:, alias_: nil, settings: nil, title: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Courier::Models::ProviderCreateParams} for more details.
      #
      #   @param provider [String] The provider key identifying the type (e.g. "sendgrid", "twilio"). Must be a kno
      #
      #   @param alias_ [String] Optional alias for this configuration.
      #
      #   @param settings [Hash{Symbol=>Object}] Provider-specific settings (snake_case keys). Defaults to an empty object when o
      #
      #   @param title [String] Optional display title. Omit to use "Default Configuration".
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
