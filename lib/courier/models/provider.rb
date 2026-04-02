# frozen_string_literal: true

module Courier
  module Models
    # @see Courier::Resources::Providers#create
    class Provider < Courier::Internal::Type::BaseModel
      # @!attribute id
      #   A unique identifier for the provider configuration.
      #
      #   @return [String]
      required :id, String

      # @!attribute created
      #   Unix timestamp (ms) of when the provider was created.
      #
      #   @return [Integer]
      required :created, Integer

      # @!attribute provider
      #   The provider key (e.g. "sendgrid", "twilio", "slack").
      #
      #   @return [String]
      required :provider, String

      # @!attribute settings
      #   Provider-specific settings (snake_case keys on the wire).
      #
      #   @return [Hash{Symbol=>Object}]
      required :settings, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute title
      #   Display title. Defaults to "Default Configuration" when not explicitly set.
      #
      #   @return [String]
      required :title, String

      # @!attribute alias_
      #   Optional alias for this configuration.
      #
      #   @return [String, nil]
      optional :alias_, String, api_name: :alias

      # @!attribute updated
      #   Unix timestamp (ms) of when the provider was last updated.
      #
      #   @return [Integer, nil]
      optional :updated, Integer, nil?: true

      # @!method initialize(id:, created:, provider:, settings:, title:, alias_: nil, updated: nil)
      #   A configured provider in the workspace.
      #
      #   @param id [String] A unique identifier for the provider configuration.
      #
      #   @param created [Integer] Unix timestamp (ms) of when the provider was created.
      #
      #   @param provider [String] The provider key (e.g. "sendgrid", "twilio", "slack").
      #
      #   @param settings [Hash{Symbol=>Object}] Provider-specific settings (snake_case keys on the wire).
      #
      #   @param title [String] Display title. Defaults to "Default Configuration" when not explicitly set.
      #
      #   @param alias_ [String] Optional alias for this configuration.
      #
      #   @param updated [Integer, nil] Unix timestamp (ms) of when the provider was last updated.
    end
  end
end
