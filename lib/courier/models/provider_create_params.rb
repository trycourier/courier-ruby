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
      #   provider — omitting a required field returns a 400 validation error. Set
      #   `rate_limit` to cap this configuration's send rate:
      #   `{ "rate": <number greater than 0>, "period": "second" | "minute" | "hour" }`,
      #   e.g. `{ "rate": 0.5, "period": "minute" }` for one send every 2 minutes. The
      #   interval between sends (`period` divided by `rate`) must be from 1 millisecond
      #   to 12 hours, otherwise the request returns a 400 `InvalidRateLimit` error. The
      #   limit applies per configuration and per environment (a test-environment
      #   configuration has its own limit). Sends above the rate are queued, not dropped,
      #   and changes take up to 60 seconds to apply. It has no effect on observability or
      #   CDP integrations, which do not send messages. Omit it or set it to null for no
      #   limit.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :settings, Courier::Internal::Type::HashOf[Courier::Internal::Type::Unknown]

      # @!attribute title
      #   Optional display title. Omit to use "Default Configuration".
      #
      #   @return [String, nil]
      optional :title, String

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_idempotency_expiration
      #
      #   @return [String, nil]
      optional :x_idempotency_expiration, String

      # @!method initialize(provider:, alias_: nil, settings: nil, title: nil, idempotency_key: nil, x_idempotency_expiration: nil, request_options: {})
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
      #   @param idempotency_key [String]
      #
      #   @param x_idempotency_expiration [String]
      #
      #   @param request_options [Courier::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
